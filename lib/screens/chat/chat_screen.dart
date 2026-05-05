import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/chat_tile.dart';

import '../../core/services/api_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<Map<String, dynamic>> _conversationsFuture;

  @override
  void initState() {
    super.initState();
    _conversationsFuture = ApiService.get('api/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            // Fixed Header
            _buildHeader(context),
            // Search Bar (Fixed at top)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: "Search Chat",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            // Scrollable List
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: _conversationsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (!snapshot.hasData || (snapshot.data!['conversations'] as List?)?.isEmpty != false) {
                    return const Center(child: Text("No conversations yet."));
                  }

                  final conversations = snapshot.data!['conversations'] as List<dynamic>;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: conversations.length,
                    itemBuilder: (context, index) {
                      final conv = conversations[index];
                      // Format time basic
                      String formattedTime = "";
                      if (conv['timestamp'] != null) {
                        final dt = DateTime.parse(conv['timestamp']);
                        formattedTime = "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
                      }

                      return ChatTile(
                        peerId: conv['peerId'],
                        name: conv['peerName'],
                        lastMessage: conv['lastMessage'],
                        unreadCount: conv['unreadCount'],
                        time: formattedTime.isNotEmpty ? formattedTime : null,
                        avatarUrl: conv['peerAvatarUrl'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Image.asset(
          'img/weather.png',
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
        // Overlay for better text visibility
        Positioned.fill(
          child: Container(color: Colors.black.withValues(alpha: 0.1)),
        ),
        // Title
        const Positioned(
          left: 20,
          bottom: 30,
          child: Text(
            "Chat",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // Search Icon in the Header
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  ChatTile(
                    name: "Yoo Jin",
                    lastMessage: "It's a beautiful place",
                    unreadCount: 2,
                    time: "10:32 AM",
                    avatarUrl: "/img/avatar/1.png",
                  ),
                  ChatTile(
                    name: "Jonathan P",
                    lastMessage: "We can start at 8am",
                    time: "10:30 AM",
                    avatarUrl: "/img/avatar/2.png",
                  ),
                  ChatTile(
                    name: "Myung Dae",
                    lastMessage: "See you tomorrow",
                    time: "11:30 AM",
                    avatarUrl: "/img/avatar/3.png",
                  ),
                ],
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

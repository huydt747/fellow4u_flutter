import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/services/chat_service.dart';
import '../../core/services/session_service.dart';
import 'widgets/chat_tile.dart';
import 'user_search_screen.dart';
import '../../core/utils/error_handler.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> _conversations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchConversations();
  }

  Future<void> _fetchConversations() async {
    final userId = SessionService.currentUserId;
    if (userId == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final conversations = await ChatService.getConversations(userId);
      if (mounted) {
        setState(() {
          _conversations = conversations;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
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
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _conversations.isEmpty
                      ? const Center(child: Text("No conversations yet"))
                      : RefreshIndicator(
                          onRefresh: _fetchConversations,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: _conversations.length,
                            itemBuilder: (context, index) {
                              final conv = _conversations[index];
                              final otherUser = conv['otherUser'];
                              return ChatTile(
                                name: otherUser['fullName'] ?? otherUser['username'],
                                lastMessage: conv['lastMessage'] ?? "Start a conversation",
                                time: conv['lastMessageTime'] != null 
                                    ? _formatTime(conv['lastMessageTime']) 
                                    : null,
                                avatarUrl: otherUser['avatarUrl'],
                                conversationId: conv['id'],
                                otherUserId: otherUser['id'],
                                onReturn: _fetchConversations,
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserSearchScreen()),
          );
          if (result == true) {
            _fetchConversations();
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  String _formatTime(String timestampStr) {
    final dt = DateTime.parse(timestampStr).toLocal();
    final now = DateTime.now();
    if (dt.day == now.day && dt.month == now.month && dt.year == now.year) {
      final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
      final period = dt.hour >= 12 ? "PM" : "AM";
      final minute = dt.minute.toString().padLeft(2, '0');
      return "$hour:$minute $period";
    }
    return "${dt.day}/${dt.month}";
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
          child: GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserSearchScreen()),
              );
              if (result == true) {
                _fetchConversations();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person_add, color: Colors.white, size: 24),
            ),
          ),
        ),
      ],
    );
  }
}

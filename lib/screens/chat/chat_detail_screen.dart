import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import 'widgets/chat_bubble.dart';

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String avatarUrl;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 18, backgroundImage: NetworkImage(avatarUrl)),
            const SizedBox(width: 8),
            // The plus icon as in the mockup
            GestureDetector(
              onTap: () {
                // Show contacts placeholder
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Showing contacts...")),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: AppColors.primary, size: 20),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildDateSeparator("Jan 28, 2020"),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ChatBubble(
                  text: "chào em",
                  isMe: false,
                  senderName: "Yoo Jin",
                  time: "10:30 AM",
                  avatarUrl: avatarUrl,
                  isFirstInGroup: true,
                ),
                const ChatBubble(
                  text: "anh đứng đây từ chiều",
                  isMe: false,
                  isFirstInGroup: false,
                ),
                const ChatBubble(
                  text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaâ'",
                  isMe: true,
                  time: "10:31 AM",
                  isFirstInGroup: true,
                ),
                const ChatBubble(text: "ok", isMe: true, isFirstInGroup: false),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildDateSeparator(String date) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        date,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          _buildIconButton(Icons.mic_none),
          const SizedBox(width: 10),
          _buildIconButton(Icons.image_outlined),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Type message",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Icon(icon, color: Colors.grey[600], size: 24),
    );
  }
}

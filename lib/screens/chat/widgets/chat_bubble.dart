import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String? senderName;
  final String? time;
  final String? avatarUrl;
  final bool isFirstInGroup;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    this.senderName,
    this.time,
    this.avatarUrl,
    this.isFirstInGroup = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return _buildOutgoingBubble();
    } else {
      return _buildIncomingBubble();
    }
  }

  Widget _buildIncomingBubble() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar on the left
          if (isFirstInGroup)
            CircleAvatar(
              radius: 18,
              backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
              backgroundColor: Colors.grey[200],
              child: avatarUrl == null
                  ? const Icon(Icons.person, size: 20, color: Colors.white)
                  : null,
            )
          else
            const SizedBox(width: 36), // Same width as CircleAvatar (radius 18 * 2)
          
          const SizedBox(width: 12),
          
          // Name, Time, and Bubble
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isFirstInGroup) ...[
                  Row(
                    children: [
                      Text(
                        senderName ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1E1E),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15),
                      bottomLeft: Radius.circular(isFirstInGroup ? 0 : 15),
                      bottomRight: const Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40), // Right padding for incoming messages
        ],
      ),
    );
  }

  Widget _buildOutgoingBubble() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isFirstInGroup && time != null) ...[
            Text(
              time!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 60), // Left padding for outgoing messages
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F9),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15),
                      bottomLeft: const Radius.circular(15),
                      bottomRight: Radius.circular(isFirstInGroup ? 0 : 15),
                    ),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

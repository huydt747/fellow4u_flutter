import 'package:flutter/material.dart';

enum NotificationType { location, payment, review }

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final NotificationType type;
  final String avatarUrl;
  final bool isUnread;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.type,
    required this.avatarUrl,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isUnread
          ? Colors.blue.withValues(alpha: 0.05)
          : Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1E1E1E),
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' $subtitle'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      children: [
        CircleAvatar(radius: 26, backgroundImage: NetworkImage(avatarUrl)),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: _getStatusColor(),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Icon(_getStatusIcon(), size: 10, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (type) {
      case NotificationType.location:
        return Colors.orange;
      case NotificationType.payment:
        return Colors.green;
      case NotificationType.review:
        return Colors.blue;
    }
  }

  IconData _getStatusIcon() {
    switch (type) {
      case NotificationType.location:
        return Icons.location_on;
      case NotificationType.payment:
        return Icons.attach_money;
      case NotificationType.review:
        return Icons.edit;
    }
  }
}

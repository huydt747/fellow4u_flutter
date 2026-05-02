import 'package:flutter/material.dart';
import 'widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const NotificationTile(
                  title: 'Yoo Jin',
                  subtitle:
                      'chose you for the trip in Danang, Vietnam on Jan 20, 2020',
                  date: 'Jan 16',
                  type: NotificationType.location,
                  avatarUrl: '/img/avatar/1.png',
                  isUnread: true,
                ),
                const Divider(height: 1, indent: 80),
                const NotificationTile(
                  title: 'Yoo Jin',
                  subtitle:
                      'paid upfront 50% for the trip in Danang, Vietnam on Jan 20, 2020. You can start the trip as scheduled.',
                  date: 'Jan 16',
                  type: NotificationType.payment,
                  avatarUrl: '/img/avatar/1.png',
                ),
                const Divider(height: 1, indent: 80),
                const NotificationTile(
                  title: 'Yoo Jin',
                  subtitle: 'left a review for you',
                  date: 'Jan 24',
                  type: NotificationType.review,
                  avatarUrl: '/img/avatar/1.png',
                ),
                const Divider(height: 1, indent: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/weather.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Search Icon
        Positioned(
          top: MediaQuery.of(context).padding.top + 5,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 24),
          ),
        ),
        // Title
        const Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

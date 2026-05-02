import 'package:flutter/material.dart';

class TripCardAction {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const TripCardAction({
    required this.label,
    required this.icon,
    this.onPressed,
  });
}

class TripCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String time;
  final String person;
  final String imagePath;
  final String avatarPath;
  final String? status;
  final List<TripCardAction>? actions;

  const TripCard({
    super.key,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.person,
    required this.imagePath,
    required this.avatarPath,
    this.status,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageStack(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTripDetails(),
                _buildAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageStack() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset(
            imagePath,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        if (status != null)
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  if (status == 'Mark Finished') ...[
                    const Icon(Icons.check, size: 18, color: Colors.black),
                    const SizedBox(width: 5),
                  ],
                  Text(
                    status!,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(width: 5),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTripDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildDetailRow(Icons.calendar_today_outlined, date),
          const SizedBox(height: 5),
          _buildDetailRow(Icons.access_time, time),
          const SizedBox(height: 5),
          _buildDetailRow(Icons.person_outline, person),
          const SizedBox(height: 15),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildActions() {
    if (actions != null && actions!.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<TripCardAction> currentActions = actions ??
        [
          const TripCardAction(label: 'Detail', icon: Icons.info_outline),
        ];

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: currentActions
            .map((action) => _buildActionButton(action))
            .toList(),
      ),
    );
  }

  Widget _buildActionButton(TripCardAction action) {
    return OutlinedButton.icon(
      onPressed: action.onPressed ?? () {},
      icon: Icon(action.icon, size: 18),
      label: Text(action.label),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF00CEA6),
        side: const BorderSide(color: Color(0xFF00CEA6)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF00CEA6), width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          avatarPath,
          width: 60, // Adjusted size to fit better with multiple buttons
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

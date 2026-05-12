import 'package:flutter/material.dart';
import '../../chat/chat_detail_screen.dart';
import '../../../core/services/trip_service.dart';
import '../../../core/services/session_service.dart';
import '../../../core/services/chat_service.dart';
import 'trip_card.dart';
import '../../../core/utils/error_handler.dart';

class TripListBase extends StatefulWidget {
  final String tripType;

  const TripListBase({super.key, required this.tripType});

  @override
  State<TripListBase> createState() => _TripListBaseState();
}

class _TripListBaseState extends State<TripListBase> {
  List<dynamic> _trips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTrips();
  }

  Future<void> _fetchTrips() async {
    final userId = SessionService.currentUserId;
    if (userId == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final trips = await TripService.getTrips(
        userId,
        status: widget.tripType.toLowerCase(),
      );
      if (mounted) {
        setState(() {
          _trips = trips;
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

  Future<void> _updateStatus(int tripId, String newStatus) async {
    try {
      await TripService.updateTripStatus(tripId, newStatus);
      _fetchTrips(); // Refresh the list
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    }
  }

  void _openChat(Map<String, dynamic> guide) async {
    final currentUserId = SessionService.currentUserId;
    if (currentUserId == null) return;

    try {
      final conversationId = await ChatService.createConversation(
        currentUserId,
        guide['id'],
      );
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: guide['fullName'] ?? "Guide",
              avatarUrl: guide['avatarUrl'] ?? "",
              conversationId: conversationId,
              otherUserId: guide['id'],
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_trips.isEmpty) {
      return Center(
        child: Text("No ${widget.tripType.toLowerCase()} trips found"),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchTrips,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          final trip = _trips[index];
          final guide = trip['guide'];

          List<TripCardAction> actions = [
            const TripCardAction(label: 'Detail', icon: Icons.info_outline),
          ];

          if (guide != null) {
            actions.add(
              TripCardAction(
                label: 'Chat',
                icon: Icons.chat_bubble_outline,
                onPressed: () => _openChat(guide),
              ),
            );
          }

          if (widget.tripType == 'Next') {
            actions.add(
              TripCardAction(
                label: 'Start',
                icon: Icons.play_arrow_outlined,
                onPressed: () => _updateStatus(trip['id'], 'current'),
              ),
            );
          } else if (widget.tripType == 'Current') {
            actions.add(
              TripCardAction(
                label: 'Mark Finished',
                icon: Icons.check,
                onPressed: () => _updateStatus(trip['id'], 'past'),
              ),
            );
          }

          return TripCard(
            title: trip['title'],
            location: trip['destination'],
            date: _formatDate(trip['startDate']),
            time:
                '8:00 - 10:00', // Placeholder or use dynamic time if available
            person: guide != null
                ? (guide['fullName'] ?? guide['username'])
                : 'No Guide',
            imagePath: trip['imageUrl'] ?? 'img/dragon-bridge.png',
            avatarPath: guide?['avatarUrl'],
            status: widget.tripType == 'Current' ? 'Ongoing' : null,
            actions: actions,
          );
        },
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'TBD';
    final dt = DateTime.parse(dateStr);
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return "${months[dt.month - 1]} ${dt.day}, ${dt.year}";
  }
}

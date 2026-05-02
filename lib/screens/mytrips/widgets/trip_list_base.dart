import 'package:flutter/material.dart';
import 'trip_card.dart';

class TripListBase extends StatelessWidget {
  final String tripType;

  const TripListBase({super.key, required this.tripType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 2, // Placeholder
      itemBuilder: (context, index) {
        return TripCard(
          title: 'Dragon Bridge Trip',
          location: 'Da Nang, Vietnam',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          person: 'Yoo Jin',
          imagePath: 'img/dragon-bridge.png',
          avatarPath: 'img/picture7.png',
          status: tripType == 'Current' ? 'Mark Finished' : null,
        );
      },
    );
  }
}

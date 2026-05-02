import 'package:flutter/material.dart';
import '../widgets/trip_card.dart';

class PastTripsTab extends StatelessWidget {
  const PastTripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: const [
        TripCard(
          title: 'Quoc Tu Giam Temple',
          location: 'Hanoi, Vietnam',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          person: 'Stephne',
          imagePath: 'img/picture3.png',
          avatarPath: 'img/picture5.png',
          actions: [],
        ),
        TripCard(
          title: 'Dinh Doc Lap',
          location: 'Ho Chi Minh, Vietnam',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          person: 'Myung Dae',
          imagePath: 'img/picture7.png',
          avatarPath: 'img/picture2.png',
          actions: [],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/trip_card.dart';

class NextTripsTab extends StatelessWidget {
  const NextTripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        const TripCard(
          title: 'Ho Guom Trip',
          location: 'Hanoi, Vietnam',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          person: 'Jonathan P',
          imagePath: 'img/picture6.png',
          avatarPath: 'img/picture7.png',
          actions: [
            TripCardAction(label: 'Detail', icon: Icons.info_outline),
            TripCardAction(label: 'Chat', icon: Icons.chat_bubble_outline),
            TripCardAction(label: 'Start', icon: Icons.play_arrow_outlined),
          ],
        ),
        const TripCard(
          title: 'Ho Chi Minh Mausoleum',
          location: 'Hanoi, Vietnam',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          person: 'Stephne',
          imagePath: 'img/picture4.png',
          avatarPath: 'img/picture5.png',
          status: 'New Request',
          actions: [
            TripCardAction(label: 'Detail', icon: Icons.info_outline),
          ],
        ),
        const TripCard(
          title: 'Duc Ba Church',
          location: 'Ho Chi Minh, Vietnam',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          person: 'Myung Dae',
          imagePath: 'img/picture1.png',
          avatarPath: 'img/picture2.png',
          status: 'Bidding',
          actions: [
            TripCardAction(label: 'Detail', icon: Icons.info_outline),
            TripCardAction(label: 'Chat', icon: Icons.chat_bubble_outline),
          ],
        ),
      ],
    );
  }
}

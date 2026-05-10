import 'package:flutter/material.dart';
import '../widgets/trip_list_base.dart';

class PastTripsTab extends StatelessWidget {
  const PastTripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const TripListBase(tripType: 'Past');
  }
}

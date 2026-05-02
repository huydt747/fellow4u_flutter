import 'package:flutter/material.dart';
import '../widgets/trip_list_base.dart';

class CurrentTripsTab extends StatelessWidget {
  const CurrentTripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const TripListBase(tripType: 'Current');
  }
}

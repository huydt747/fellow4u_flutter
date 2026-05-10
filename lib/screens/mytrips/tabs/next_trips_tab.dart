import 'package:flutter/material.dart';
import '../widgets/trip_list_base.dart';

class NextTripsTab extends StatelessWidget {
  const NextTripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const TripListBase(tripType: 'Next');
  }
}

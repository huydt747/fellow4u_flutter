import 'package:flutter/material.dart';
import 'widgets/explore_header.dart';
import 'widgets/finding_guide_section.dart';
import 'widgets/guides_grid_section.dart';
import 'widgets/top_experiences_section.dart';
import 'widgets/featured_tours_section.dart';
import 'widgets/travel_news_section.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ExploreHeader(),
            const FindingGuideSection(),
            const GuidesGridSection(),
            const TopExperiencesSection(),
            const FeaturedToursSection(),
            const TravelNewsSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

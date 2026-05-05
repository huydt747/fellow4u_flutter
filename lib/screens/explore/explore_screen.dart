import 'package:flutter/material.dart';
import 'widgets/explore_header.dart';
import 'widgets/finding_guide_section.dart';
import 'widgets/guides_grid_section.dart';
import 'widgets/top_experiences_section.dart';
import 'widgets/featured_tours_section.dart';
import 'widgets/travel_news_section.dart';
import '../../core/services/api_service.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<Map<String, dynamic>> _exploreDataFuture;

  @override
  void initState() {
    super.initState();
    _exploreDataFuture = ApiService.get('explore');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Map<String, dynamic>>(
        future: _exploreDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          final data = snapshot.data!;
          final guides = data['guides'] as List<dynamic>? ?? [];
          final tours = data['tours'] as List<dynamic>? ?? [];
          final experiences = data['experiences'] as List<dynamic>? ?? [];

          return SingleChildScrollView(
            child: Column(
              children: [
                const ExploreHeader(),
                const FindingGuideSection(),
                GuidesGridSection(guides: guides),
                TopExperiencesSection(experiences: experiences),
                FeaturedToursSection(tours: tours),
                const TravelNewsSection(),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}

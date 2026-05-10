import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/api_service.dart';
import '../../../core/widgets/server_image.dart';

class TopExperiencesSection extends StatefulWidget {
  const TopExperiencesSection({super.key});

  @override
  State<TopExperiencesSection> createState() => _TopExperiencesSectionState();
}

class _TopExperiencesSectionState extends State<TopExperiencesSection> {
  List<dynamic> activities = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchActivities();
  }

  Future<void> _fetchActivities() async {
    try {
      final response = await ApiService.get('api/users?role=Guide');
      setState(() {
        // Only show guides who have an activity defined
        activities = (response as List<dynamic>).where((u) => 
          u['activityTitle'] != null && u['activityImageUrl'] != null
        ).toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching activities: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Experiences",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: _fetchActivities,
                child: const Text(
                  "SEE MORE",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (isLoading)
          const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()))
        else if (activities.isEmpty)
          const Center(child: Padding(padding: EdgeInsets.all(20), child: Text("No experiences found")))
        else
          SizedBox(
            height: 420,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                final title = activity['activityTitle'] ?? 'Experience';
                final location = "${activity['city'] ?? 'Danang'}, ${activity['country'] ?? 'Vietnam'}";
                final guideName = activity['fullName'] ?? activity['firstName'] ?? 'Guide';
                
                final imageUrl = activity['activityImageUrl'];
                final fullImageUrl = imageUrl != null && imageUrl.startsWith('/')
                    ? '${ApiService.baseUrl}$imageUrl'
                    : imageUrl;

                final guideImageUrl = activity['avatarUrl'];
                final fullGuideImageUrl = guideImageUrl != null && guideImageUrl.startsWith('/')
                    ? '${ApiService.baseUrl}$guideImageUrl'
                    : guideImageUrl;

                return _ExperienceCard(
                  title: title,
                  location: location,
                  guideName: guideName,
                  imageUrl: fullImageUrl,
                  guideImageUrl: fullGuideImageUrl,
                );
              },
            ),
          ),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String title;
  final String location;
  final String guideName;
  final String? imageUrl;
  final String? guideImageUrl;

  const _ExperienceCard({
    required this.title,
    required this.location,
    required this.guideName,
    required this.imageUrl,
    required this.guideImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Overlays
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ServerImage(
                  url: imageUrl,
                  height: 280,
                  width: 240,
                  fit: BoxFit.cover,
                  fallbackUrl: 'img/scene/3.png',
                ),
              ),
              // Guide Avatar with thick border
              Positioned(
                bottom: 30, // Positioned near bottom of image
                left: 0,
                right: 0,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4), // Border width
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: ServerImage(
                              url: guideImageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              fallbackUrl: 'img/avatar/4.png',
                            ),
                          ),
                        ),
                      ),
                      // Name Pill Overlay
                      Positioned(
                        bottom: -10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            guideName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          // Title
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          // Location
          Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.primary, size: 18),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/api_service.dart';
import '../../../core/utils/error_handler.dart';
import '../../../core/widgets/server_image.dart';

class GuidesGridSection extends StatefulWidget {
  const GuidesGridSection({super.key});

  @override
  State<GuidesGridSection> createState() => _GuidesGridSectionState();
}

class _GuidesGridSectionState extends State<GuidesGridSection> {
  List<dynamic> guides = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchGuides();
  }

  Future<void> _fetchGuides() async {
    try {
      final response = await ApiService.get('api/users?role=Guide');
      setState(() {
        guides = response as List<dynamic>;
        isLoading = false;
      });
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Guides in Danang",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: _fetchGuides,
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
          const SizedBox(height: 10),
          if (isLoading)
            const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()))
          else if (guides.isEmpty)
            const Center(child: Padding(padding: EdgeInsets.all(20), child: Text("No guides found")))
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemCount: guides.length > 4 ? 4 : guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                final firstName = guide['firstName'] ?? '';
                final lastName = guide['lastName'] ?? '';
                final fullName = guide['fullName'] ?? '$firstName $lastName';
                final city = guide['city'] ?? 'Danang';
                final country = guide['country'] ?? 'Vietnam';
                final reviews = "${guide['reviewCount'] ?? 0} Reviews";
                final avatarUrl = guide['avatarUrl'];
                
                // Get original URL if it's from the server
                final fullAvatarUrl = avatarUrl != null && avatarUrl.startsWith('/')
                    ? '${ApiService.baseUrl}$avatarUrl'
                    : avatarUrl;

                return _GuideProfileCard(
                  name: fullName,
                  location: "$city, $country",
                  reviews: reviews,
                  imageUrl: fullAvatarUrl,
                );
              },
            ),
        ],
      ),
    );
  }
}

class _GuideProfileCard extends StatelessWidget {
  final String name;
  final String location;
  final String reviews;
  final String? imageUrl;

  const _GuideProfileCard({
    required this.name,
    required this.location,
    required this.reviews,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image with corner-rounded and star overlay
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ServerImage(
                  url: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  fallbackUrl: 'img/avatar/3.png',
                ),
              ),
              // Stars and reviews overlay
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      reviews,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Name
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        // City and country
        Row(
          children: [
            const Icon(Icons.location_on, color: AppColors.primary, size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                location,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class GuidesGridSection extends StatelessWidget {
  const GuidesGridSection({super.key});

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
                onPressed: () {},
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
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            childAspectRatio: 0.75, // Adjust based on design height
            children: const [
              _GuideProfileCard(
                name: "Tuan Tran",
                location: "Danang, Vietnam",
                reviews: "127 Reviews",
                imageUrl: "img/avatar/5.png",
              ),
              _GuideProfileCard(
                name: "Emmy",
                location: "Hanoi, Vietnam",
                reviews: "89 Reviews",
                imageUrl: "img/avatar/6.png",
              ),
              _GuideProfileCard(
                name: "Linh Hana",
                location: "Danang, Vietnam",
                reviews: "127 Reviews",
                imageUrl: "img/avatar/7.png",
              ),
              _GuideProfileCard(
                name: "Khai Ho",
                location: "Ho Chi Minh, Vietnam",
                reviews: "127 Reviews",
                imageUrl: "img/avatar/8.png",
              ),
            ],
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
  final String imageUrl;

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
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
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

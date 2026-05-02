import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class FeaturedToursSection extends StatelessWidget {
  const FeaturedToursSection({super.key});

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
                "Featured Tours",
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
        ),
        const SizedBox(height: 10),
        ListView(
          shrinkWrap: true, // Necessary within SingleChildScrollView
          physics:
              const NeverScrollableScrollPhysics(), // Horizontal scrolling handled by SingleChildScrollView's column
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            _TourCard(
              title: "Da Nang - Ba Na - Hoi An",
              date: "Jan 30, 2020",
              duration: "3 days",
              price: "\$400.00",
              likes: "1247 likes",
              isFavorite: false,
              imageUrl: "img/scene/1.png",
            ),
            SizedBox(height: 20),
            _TourCard(
              title: "Melbourne - Sydney",
              date: "Jan 30, 2020",
              duration: "3 days",
              price: "\$600.00",
              likes: "1247 likes",
              isFavorite: true,
              imageUrl: "img/scene/2.png",
            ),
            SizedBox(height: 20),
            _TourCard(
              title: "Hanoi - Ha Long Bay",
              date: "Jan 30, 2020",
              duration: "3 days",
              price: "\$300.00",
              likes: "1247 likes",
              isFavorite: false,
              imageUrl: "img/scene/3.png",
            ),
            SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}

class _TourCard extends StatelessWidget {
  final String title;
  final String date;
  final String duration;
  final String price;
  final String likes;
  final bool isFavorite;
  final String imageUrl;

  const _TourCard({
    required this.title,
    required this.date,
    required this.duration,
    required this.price,
    required this.likes,
    required this.isFavorite,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Overlays
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Top Right Bookmark
              Positioned(
                top: 15,
                right: 15,
                child: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              // Bottom Left Stars and Likes
              Positioned(
                bottom: 15,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      likes,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Details Area
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          duration,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

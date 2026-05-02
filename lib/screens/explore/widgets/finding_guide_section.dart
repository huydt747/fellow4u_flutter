import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class FindingGuideSection extends StatelessWidget {
  const FindingGuideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50), // Spacing for the overlapping search bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Finding a Guide",
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
          _GuideCard(
            name: "Yoo Jin",
            country: "Korea",
            date: "Jan 30, 2020",
            location: "Danang, Vietnam",
            imageUrl: "img/avatar/1.png",
          ),
          const SizedBox(height: 15),
          _GuideCard(
            name: "Jon Mark",
            country: "Spain",
            date: "Jan 30, 2020",
            location: "Danang, Vietnam",
            imageUrl: "img/avatar/2.png",
          ),
          const SizedBox(height: 15),
          _GuideCard(
            name: "Lynd Nguyen",
            country: "US",
            date: "Jan 30, 2020",
            location: "Danang, Vietnam",
            imageUrl: "img/avatar/3.png",
          ),
          const SizedBox(height: 15),
          _GuideCard(
            name: "Patrick",
            country: "Italy",
            date: "Jan 30, 2020",
            location: "Danang, Vietnam",
            imageUrl: "img/avatar/4.png",
          ),
        ],
      ),
    );
  }
}

class _GuideCard extends StatelessWidget {
  final String name;
  final String country;
  final String date;
  final String location;
  final String imageUrl;

  const _GuideCard({
    required this.name,
    required this.country,
    required this.date,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          children: [
            // Left Image
            Expanded(
              flex: 2,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            // Right Content
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                        children: [
                          TextSpan(
                            text: name,
                            style: FontWeight.bold.toStyle(),
                          ),
                          TextSpan(
                            text: " from $country",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Finding a Guide",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on FontWeight {
  TextStyle toStyle() => TextStyle(fontWeight: this);
}

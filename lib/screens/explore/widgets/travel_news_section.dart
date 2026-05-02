import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TravelNewsSection extends StatelessWidget {
  const TravelNewsSection({super.key});

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
                "Travel News",
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            _NewsItem(
              title: "New Destination in Danang City",
              date: "Feb 5, 2020",
              imageUrl: "img/scene/5.png",
            ),
            SizedBox(height: 30),
            _NewsItem(
              title: "\$1 Flight Ticket",
              date: "Feb 5, 2020",
              imageUrl: "img/scene/6.png",
            ),
            SizedBox(height: 30),
            _NewsItem(
              title: "Visit Korea this Tet Holiday",
              date: "Jan 26, 2020",
              imageUrl: "img/scene/1.png",
            ),
            SizedBox(height: 40),
          ],
        ),
      ],
    );
  }
}

class _NewsItem extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;

  const _NewsItem({
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(date, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

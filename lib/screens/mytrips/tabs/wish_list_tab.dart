import 'package:flutter/material.dart';

import '../../../core/services/api_service.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({super.key});

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
  late Future<Map<String, dynamic>> _tripsDataFuture;

  @override
  void initState() {
    super.initState();
    _tripsDataFuture = ApiService.get('api/trips');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _tripsDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('No trips found'));
        }

        final data = snapshot.data!;
        final allTrips = data['trips'] as List<dynamic>? ?? [];
        final wishlistTrips = allTrips.where((t) => t['status'] == 'wishlist').toList();

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: wishlistTrips.map((t) => WishListCard(
            title: t['title'],
            imagePath: t['imageUrl'] ?? 'img/sydney.png',
            date: t['date'] ?? 'Jan 30, 2020',
            duration: t['duration'] ?? '3 days',
            price: t['price'] ?? '\$600.00',
            rating: (t['rating'] ?? 4.5).toDouble(),
            likes: t['likes'] ?? '1247 likes',
            isLiked: t['isLiked'] ?? false,
          )).toList(),
        );
      },
    );
  }
}

class WishListCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String date;
  final String duration;
  final String price;
  final double rating;
  final String likes;
  final bool isLiked;

  const WishListCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.duration,
    required this.price,
    required this.rating,
    required this.likes,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageStack(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFF00CEA6),
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(Icons.calendar_today_outlined, date),
                        const SizedBox(height: 5),
                        _buildInfoRow(Icons.access_time, duration),
                      ],
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF00CEA6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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

  Widget _buildImageStack() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset(
            imagePath,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: const Icon(Icons.bookmark, color: Colors.white, size: 28),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Row(
            children: [
              _buildRatingStars(),
              const SizedBox(width: 8),
              Text(
                likes,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingStars() {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) > 0;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.orange, size: 16));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(const Icon(Icons.star_half, color: Colors.orange, size: 16));
      } else {
        stars.add(
          const Icon(Icons.star_border, color: Colors.orange, size: 16),
        );
      }
    }
    return Row(children: stars);
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/api_service.dart';

class TravelNewsSection extends StatefulWidget {
  const TravelNewsSection({super.key});

  @override
  State<TravelNewsSection> createState() => _TravelNewsSectionState();
}

class _TravelNewsSectionState extends State<TravelNewsSection> {
  List<dynamic> newsItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      final response = await ApiService.get('api/news');
      setState(() {
        newsItems = response as List<dynamic>;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching news: $e');
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
                "Travel News",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: _fetchNews,
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
        else if (newsItems.isEmpty)
          const Center(child: Padding(padding: EdgeInsets.all(20), child: Text("No travel news found")))
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              final news = newsItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _NewsItem(
                  title: news['title'] ?? 'News',
                  date: news['date'] ?? 'N/A',
                  imageUrl: news['imageUrl'] ?? 'img/scene/1.png',
                ),
              );
            },
          ),
        const SizedBox(height: 10),
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
          child: imageUrl.startsWith('http')
              ? Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
        ),
      ],
    );
  }
}

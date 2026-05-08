import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ServerImage extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final String fallbackUrl;
  final double? width;
  final double? height;

  const ServerImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.fallbackUrl = 'https://i.pravatar.cc/300',
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return Image.network(fallbackUrl, fit: fit, width: width, height: height);
    }

    // If it's a standard web URL, use NetworkImage
    if (!url!.contains('/uploads/')) {
      return Image.network(url!, fit: fit, width: width, height: height);
    }

    // If it's from our server, fetch the Base64 JSON
    return FutureBuilder<dynamic>(
      future: ApiService.get(url!.replaceFirst(ApiService.baseUrl + '/', '')),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }
        
        if (snapshot.hasError || snapshot.data == null) {
          return Image.network(fallbackUrl, fit: fit, width: width, height: height);
        }

        try {
          final data = snapshot.data as Map<String, dynamic>;
          final base64Data = data['data'] as String;
          return Image.memory(
            base64Decode(base64Data),
            fit: fit,
            width: width,
            height: height,
          );
        } catch (e) {
          return Image.network(fallbackUrl, fit: fit, width: width, height: height);
        }
      },
    );
  }
}

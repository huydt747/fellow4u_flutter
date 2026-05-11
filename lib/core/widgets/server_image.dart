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
    this.fallbackUrl = 'img/avatar/1.png',
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      if (fallbackUrl.startsWith('img/')) {
        return Image.asset(fallbackUrl, fit: fit, width: width, height: height);
      }
      return Image.network(fallbackUrl, fit: fit, width: width, height: height);
    }

    String finalUrl = url!;
    if (finalUrl.startsWith('/')) {
      finalUrl = '${ApiService.baseUrl}$finalUrl';
    }

    // If it's a standard web URL, use NetworkImage
    if (!finalUrl.contains('/uploads/')) {
      if (finalUrl.startsWith('img/')) {
        return Image.asset(finalUrl, fit: fit, width: width, height: height);
      }
      return Image.network(finalUrl, fit: fit, width: width, height: height);
    }

    // If it's from our server, fetch the Base64 JSON
    final apiPath = finalUrl.replaceFirst('${ApiService.baseUrl}/', '');
    return FutureBuilder<dynamic>(
      future: ApiService.get(apiPath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }
        
        if (snapshot.hasError || snapshot.data == null) {
          if (fallbackUrl.startsWith('img/')) {
            return Image.asset(fallbackUrl, fit: fit, width: width, height: height);
          }
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
          if (fallbackUrl.startsWith('img/')) {
            return Image.asset(fallbackUrl, fit: fit, width: width, height: height);
          }
          return Image.network(fallbackUrl, fit: fit, width: width, height: height);
        }
      },
    );
  }
}

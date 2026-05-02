import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

class ApiService {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8080';
    }
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080';
    }
    return 'http://localhost:8080';
  }

  static Future<Map<String, dynamic>> post(String path, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> get(String path) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$path'),
      headers: {'Content-Type': 'application/json'},
    );

    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      String errorMessage = 'Failed to connect to server';
      try {
        final error = jsonDecode(response.body);
        if (error is Map && error.containsKey('message')) {
          errorMessage = error['message'];
        } else {
          errorMessage = response.body;
        }
      } catch (_) {
        // If it's not JSON, use the raw body or a status message
        errorMessage = response.body.isNotEmpty ? response.body : 'Error: ${response.statusCode}';
      }
      throw Exception(errorMessage);
    }
  }
}

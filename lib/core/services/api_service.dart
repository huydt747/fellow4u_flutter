import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform, SocketException, HttpException;
import 'dart:async' show TimeoutException;
import '../exceptions/api_exception.dart';

class ApiService {
  static http.Client _client = http.Client();
  static set client(http.Client client) => _client = client;
  static http.Client get client => _client;

  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8080';
    }
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080';
    }
    return 'http://localhost:8080';
  }

  static Future<dynamic> _safeRequest(Future<http.Response> Function() request, {Duration timeout = const Duration(seconds: 10)}) async {
    try {
      final response = await request().timeout(timeout);
      return _handleResponse(response);
    } on SocketException {
      throw NoConnectionException('Cannot reach server. Please check your internet connection.');
    } on TimeoutException {
      throw NoConnectionException('Request timed out. The server might be offline.');
    } on HttpException {
      throw NoConnectionException('HTTP error occurred. Please try again.');
    } on http.ClientException catch (e) {
      throw NoConnectionException('Network error: ${e.message}');
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException(e.toString().replaceAll('Exception: ', ''));
    }
  }

  static Future<dynamic> post(String path, Map<String, dynamic> body, {http.Client? client}) async {
    return _safeRequest(() {
      final httpClient = client ?? _client;
      return httpClient.post(
        Uri.parse('$baseUrl/$path'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
    });
  }

  static Future<dynamic> patch(String path, Map<String, dynamic> body, {http.Client? client}) async {
    return _safeRequest(() {
      final httpClient = client ?? _client;
      return httpClient.patch(
        Uri.parse('$baseUrl/$path'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
    });
  }

  static Future<dynamic> get(String path, {http.Client? client}) async {
    return _safeRequest(() {
      final httpClient = client ?? _client;
      return httpClient.get(
        Uri.parse('$baseUrl/$path'),
        headers: {'Content-Type': 'application/json'},
      );
    });
  }

  static Future<dynamic> uploadFile(String path, List<int> bytes, String fileName, {http.Client? client}) async {
    try {
      final httpClient = client ?? _client;
      final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$path'));
      request.files.add(http.MultipartFile.fromBytes('file', bytes, filename: fileName));
      
      final streamedResponse = await httpClient.send(request).timeout(const Duration(seconds: 30));
      final response = await http.Response.fromStream(streamedResponse);
      
      return _handleResponse(response);
    } on SocketException {
      throw NoConnectionException('Cannot reach server. Please check your internet connection.');
    } on TimeoutException {
      throw NoConnectionException('Upload timed out. The server might be offline.');
    } on http.ClientException catch (e) {
      throw NoConnectionException('Network error: ${e.message}');
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException(e.toString().replaceAll('Exception: ', ''));
    }
  }

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
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
        errorMessage = response.body.isNotEmpty ? response.body : 'Error: ${response.statusCode}';
      }

      if (response.statusCode == 401) {
        throw UnauthorizedException(errorMessage);
      } else if (response.statusCode >= 500) {
        throw ServerException(errorMessage);
      } else {
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }
    }
  }
}

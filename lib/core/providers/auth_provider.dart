import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  Map<String, dynamic>? _user;
  bool _isLoading = false;

  String? get token => _token;
  Map<String, dynamic>? get user => _user;
  bool get isAuthenticated => _token != null;
  bool get isLoading => _isLoading;

  Future<void> checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    
    final userStr = prefs.getString('auth_user');
    if (userStr != null) {
      try {
        _user = jsonDecode(userStr);
      } catch (e) {
        _user = null;
      }
    }

    // Assign token to ApiService globally
    ApiService.setToken(_token);

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.post('auth/login', {
        'username': username,
        'password': password,
      });

      _token = response['token'];
      _user = response['user'];

      final prefs = await SharedPreferences.getInstance();
      if (_token != null) {
        await prefs.setString('auth_token', _token!);
        ApiService.setToken(_token);
      }
      if (_user != null) {
        // Fetch full profile to get bio, languages, avatars, etc.
        try {
          final profileData = await ApiService.get('api/profile');
          _user = {
            ..._user!,
            ...profileData,
          };
        } catch (e) {
          print("Failed to fetch full profile: $e");
        }

        await prefs.setString('auth_user', jsonEncode(_user));
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    ApiService.setToken(null);
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('auth_user');
    
    notifyListeners();
  }

  // Update profile user data manually after fetching it from /api/profile
  void updateUserProfile(Map<String, dynamic> fullProfile) {
    _user = {
      ..._user ?? {},
      ...fullProfile,
    };
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';
import '../../core/services/session_service.dart';
import '../../core/widgets/server_image.dart';
import 'edit_profile.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  bool _notificationsEnabled = true;
  Map<String, dynamic>? _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try {
      final response = await ApiService.get('api/users');
      final List<dynamic> users = response as List<dynamic>;
      final currentUserId = SessionService.currentUserId;
      
      if (mounted) {
        setState(() {
          _userData = users.firstWhere(
            (u) => u['id'] == currentUserId,
            orElse: () => users.first,
          );
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching user for settings: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: ServerImage(
                          url: _userData?['avatarUrl'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          fallbackUrl: 'img/avatar/7.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userData?['fullName'] ?? _userData?['username'] ?? 'User',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            _userData?['role'] ?? 'Traveler',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                              userId: _userData?['id'],
                            ),
                          ),
                        );
                        if (result == true && mounted) {
                          _fetchUser(); // Refresh current screen instead of popping
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'EDIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Settings List
              _buildSettingItem(
                icon: Icons.notifications_none_outlined,
                title: 'Notifications',
                trailing: Switch(
                  value: _notificationsEnabled,
                  activeThumbColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
              ),
              _buildSettingItem(
                icon: Icons.language_outlined,
                title: 'Languages',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.credit_card_outlined,
                title: 'Payment Info',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.bar_chart_outlined,
                title: 'Income Stats',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.shield_outlined,
                title: 'Privacy & Policies',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.email_outlined,
                title: 'Feedback',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.book_outlined,
                title: 'Usage',
                onTap: () {},
              ),
              const SizedBox(height: 40),
              // Sign out
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign out',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF3F3F3), width: 1)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        leading: Icon(icon, color: Colors.black87),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing:
            trailing ??
            const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';
import '../../core/widgets/server_image.dart';
import 'profile_setting.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  final int? userId;
  const ProfileScreen({super.key, this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      final response = await ApiService.get('api/users');
      final List<dynamic> users = response as List<dynamic>;

      if (users.isNotEmpty) {
        setState(() {
          if (widget.userId != null) {
            userData = users.firstWhere(
              (u) => u['id'] == widget.userId,
              orElse: () => users.first,
            );
          } else {
            userData = users.first;
          }
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "No users found";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading)
      return const Scaffold(body: Center(child: CircularProgressIndicator(key: ValueKey('profileLoading'))));
    if (errorMessage != null)
      return Scaffold(body: Center(child: Text("Error: $errorMessage", key: const ValueKey('profileError'))));
    if (userData == null)
      return const Scaffold(body: Center(child: Text("No user data")));

    final fullName = userData!['fullName'] ?? 'No Name';
    final bio = userData!['bio'] ?? 'No introduction provided.';
    final rating = userData!['rating'] ?? 0.0;
    final reviewCount = userData!['reviewCount'] ?? 0;
    final languages = List<String>.from(userData!['languages'] ?? []);
    final avatarUrl = userData!['avatarUrl'] as String?;
    final coverPhotoUrl = userData!['coverPhotoUrl'] as String?;
    final videoUrl = userData!['videoIntroUrl'] as String?;

    const double coverHeight = 200;
    const double profileSize = 130;
    const double profileTop = coverHeight - (profileSize / 2) + 20;

    String getFullUrl(String? path) {
      if (path == null) return '';
      if (path.startsWith('/')) return '${ApiService.baseUrl}$path';
      return path;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _fetchProfile,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // 1. Cover Photo
                  Container(
                    height: coverHeight,
                    width: double.infinity,
                    child: ServerImage(
                      url: getFullUrl(coverPhotoUrl),
                      fit: BoxFit.cover,
                      fallbackUrl: 'img/scene/1.png',
                    ),
                  ),

                  // 2. Settings Icon
                  Positioned(
                    top: 30,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileSettingScreen(),
                          ),
                        );
                        if (result == true) _fetchProfile();
                      },
                    ),
                  ),

                  // 3. Profile Avatar
                  Positioned(
                    top: profileTop - 15,
                    left: 20,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: profileSize,
                          height: profileSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: ServerImage(
                              url: getFullUrl(avatarUrl),
                              fit: BoxFit.cover,
                              fallbackUrl: 'img/avatar/8.png',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(
                                    userId: userData!['id'],
                                  ),
                                ),
                              );
                              if (result == true) _fetchProfile();
                            },
                            child: Container(
                              height: 38,
                              width: 38,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 4. Name and Reviews
                  Positioned(
                    top: coverHeight + 10,
                    left: profileSize + 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          key: const ValueKey('profileName'),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$reviewCount Reviews',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Languages',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProfileScreen(userId: userData!['id']),
                              ),
                            );
                            if (result == true) _fetchProfile();
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (languages.isEmpty)
                      const Text(
                        "No languages added",
                        style: TextStyle(color: Colors.grey),
                      )
                    else
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: languages
                            .map((lang) => _buildLanguageChip(lang))
                            .toList(),
                      ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Introduction',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProfileScreen(userId: userData!['id']),
                              ),
                            );
                            if (result == true) _fetchProfile();
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bio,
                      key: const ValueKey('profileBio'),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (videoUrl != null)
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('img/scene/2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: AppColors.primary,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

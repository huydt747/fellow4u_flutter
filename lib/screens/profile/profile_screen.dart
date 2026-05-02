import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'profile_setting.dart';
import 'profile_add_photo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double coverHeight = 200;
    const double profileSize = 130;
    const double profileOffsetFromCover = 20;
    const double profileTop =
        coverHeight - (profileSize / 2) + profileOffsetFromCover;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // 1. Cover Photo
                Container(
                  height: coverHeight,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1542332213-31f87348057f?q=80&w=1000&auto=format&fit=crop',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // 2. Settings Icon
                Positioned(
                  top: 30,
                  right: 20,
                  child: IconButton(
                    icon: Image.asset(
                      'img/icon/setting.png',
                      color: Colors.white,
                      width: 28,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileSettingScreen(),
                        ),
                      );
                    },
                  ),
                ),

                // 3. Camera Icon on Cover
                Positioned(
                  bottom: 20,
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPhotoScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),

                // 4. White bar below cover (Implicit via background)

                // 5. Profile Avatar (Left, Overlapping)
                Positioned(
                  top: profileTop - 15, // Adjusted to sit a little lower
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
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage('/img/avatar/1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Camera Icon on Avatar (Bottom Center)
                      Positioned(
                        bottom: -10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddPhotoScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
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

                // 6. Name and Email (Side to Avatar)
                Positioned(
                  top: coverHeight + 10,
                  left: profileSize + 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Yoo Jin',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'yoojin@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ), // Reserve space for the overlapping avatar
          ],
        ),
      ),
    );
  }
}

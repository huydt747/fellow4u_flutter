import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? waveTitle;
  final bool showLogo;

  const AuthHeader({
    super.key,
    this.title,
    this.subtitle,
    this.waveTitle,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: screenHeight * 0.22,
            width: double.infinity,
            color: AppColors.primary,
          ),
        ),
        if (showLogo)
          Positioned(
            top: 60,
            left: 30,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Image.asset('img/logo.png', width: 50, height: 50),
            ),
          ),
        if (waveTitle != null)
          Positioned(
            top: 80,
            left: 30,
            right: 30,
            child: Text(
              waveTitle!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        if (title != null || subtitle != null)
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.82);

    var controlPoint = Offset(size.width / 2, size.height * 1.05);
    var endPoint = Offset(size.width, size.height * 0.82);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
}

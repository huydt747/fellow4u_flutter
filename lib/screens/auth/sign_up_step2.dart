import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/auth_header.dart';
import 'sign_up_step3.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(
              waveTitle: "Welcome, Tuan!",
              showLogo: false,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Text(
                "Please finish your profile so that\nTravelers can find you easily!",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildProgressIndicator(1),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Icon aligned to left as requested
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 40,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField("Address", "Address"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildTextField("City", "City")),
                      const SizedBox(width: 20),
                      Expanded(child: _buildTextField("Country", "Country")),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPhoneField(),
                  const SizedBox(height: 25),
                  _buildUploadBox("Guide License"),
                  const SizedBox(height: 20),
                  _buildUploadBox("Identity Card"),
                  const SizedBox(height: 20),
                  _buildTextField(
                    "Languages",
                    "Languages you can use to guide",
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    "Introduction",
                    "Short introduction about yourself",
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  _buildUploadBox(
                    "Video Introduction",
                    isOptional: true,
                    isVideo: true,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpStep3(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
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
    );
  }

  Widget _buildProgressIndicator(int step) {
    bool isStep1Done = step >= 1;
    bool isStep2Done = step >= 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          _buildStepCircle("Background Info", isStep1Done),
          Expanded(
            child: Container(
              height: 1,
              color: isStep2Done ? AppColors.primary : Colors.grey[300],
            ),
          ),
          _buildStepCircle("Fee & Time", isStep2Done),
        ],
      ),
    );
  }

  Widget _buildStepCircle(String label, bool isDone) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: isDone ? AppColors.primary : Colors.grey[300]!,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? AppColors.primary : Colors.grey[300]!,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDone ? AppColors.primary : Colors.grey,
            fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Text("(+84) "),
            const Icon(Icons.keyboard_arrow_down, size: 16),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadBox(
    String label, {
    bool isOptional = false,
    bool isVideo = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (isOptional)
              const Text(
                "  (Optional)",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.5),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isVideo ? Icons.videocam_outlined : Icons.camera_alt_outlined,
                color: AppColors.primary,
              ),
              const SizedBox(width: 10),
              Text(
                isVideo ? "Upload Video" : "Upload Photo",
                style: const TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

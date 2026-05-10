import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/auth_header.dart';
import '../../core/services/api_service.dart';
import 'sign_up_step2.dart';

class SignUpStep1 extends StatefulWidget {
  const SignUpStep1({super.key});

  @override
  State<SignUpStep1> createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  String selectedRole = 'Traveler';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  void _signUp() async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await ApiService.post("auth/signup", {
        "username": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "role": selectedRole,
      });

      if (mounted) {
        final userId = response['userId'] as int;
        print('Signup success on frontend. selectedRole: "$selectedRole"');
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created! Let's complete your profile.")),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpStep2(userId: userId),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up failed: $e")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      _buildRadioButton('Traveler', const ValueKey('roleTraveler')),
                      const SizedBox(width: 40),
                      _buildRadioButton('Guide', const ValueKey('roleGuide')),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(child: _buildTextField("First Name", "Tuan", controller: firstNameController, key: const ValueKey('firstNameField'))),
                      const SizedBox(width: 20),
                      Expanded(child: _buildTextField("Last Name", "Tran", controller: lastNameController, key: const ValueKey('lastNameField'))),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Email", "Type email", controller: emailController, key: const ValueKey('emailField')),
                  const SizedBox(height: 20),
                  _buildTextField(
                    "Password",
                    "Type password",
                    obscureText: true,
                    controller: passwordController,
                    key: const ValueKey('passwordField'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Password has more than 6 letters",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    "Confirm Password",
                    "••••••",
                    obscureText: true,
                    controller: confirmPasswordController,
                    key: const ValueKey('confirmPasswordField'),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: "By Signing Up, you agree to our ",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    key: const ValueKey('signUpButton'),
                    onPressed: isLoading ? null : _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("SIGN UP"),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String role, Key? key) {
    bool isSelected = selectedRole == role;
    return InkWell(
      key: key,
      onTap: () => setState(() => selectedRole = role),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? AppColors.primary : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            role,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.textPrimary : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    bool obscureText = false,
    TextEditingController? controller,
    Key? key,
  }) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
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
}

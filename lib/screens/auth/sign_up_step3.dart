import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/auth_header.dart';
import '../../core/services/api_service.dart';
import '../main_screen.dart';

class SignUpStep3 extends StatefulWidget {
  final int userId;
  const SignUpStep3({super.key, required this.userId});

  @override
  State<SignUpStep3> createState() => _SignUpStep3State();
}

class _SignUpStep3State extends State<SignUpStep3> {
  final TextEditingController fee1To3Controller = TextEditingController();
  final TextEditingController fee4To6Controller = TextEditingController();
  final TextEditingController fee7To9Controller = TextEditingController();
  final TextEditingController fee10To14Controller = TextEditingController();
  
  final TextEditingController fromTimeController = TextEditingController(text: "09:00 AM");
  final TextEditingController toTimeController = TextEditingController(text: "05:00 PM");
  
  String selectedDay = "Monday";
  bool isLoading = false;

  void _finishSignUp() async {
    setState(() => isLoading = true);

    try {
      // 1. Prepare Fees
      final List<Map<String, dynamic>> fees = [
        {"min": 1, "max": 3, "price": double.tryParse(fee1To3Controller.text) ?? 0.0},
        {"min": 4, "max": 6, "price": double.tryParse(fee4To6Controller.text) ?? 0.0},
        {"min": 7, "max": 9, "price": double.tryParse(fee7To9Controller.text) ?? 0.0},
        {"min": 10, "max": 14, "price": double.tryParse(fee10To14Controller.text) ?? 0.0},
      ];

      // 2. Prepare Availability
      final List<Map<String, dynamic>> availability = [
        {
          "day": selectedDay,
          "from": fromTimeController.text,
          "to": toTimeController.text,
        }
      ];

      // 3. Call API
      await ApiService.post("auth/update", {
        "userId": widget.userId,
        "fees": fees,
        "availability": availability,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile completed! Welcome to Fellow4U.")),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Finish failed: $e")),
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
    fee1To3Controller.dispose();
    fee4To6Controller.dispose();
    fee7To9Controller.dispose();
    fee10To14Controller.dispose();
    fromTimeController.dispose();
    toTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(
              waveTitle: "Welcome!",
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
            _buildProgressIndicator(2),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const Text("Set Fee", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("The price unit is US \$/hour", style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 20),
                  _buildFeeTable(),
                  const SizedBox(height: 35),
                  const Text("Set Available Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("The time you can work on Fellow4U as a Guide", style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 20),
                  _buildDaySelector(),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(child: _buildTimePicker("From", fromTimeController)),
                      const SizedBox(width: 20),
                      Expanded(child: _buildTimePicker("To", toTimeController)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: const ValueKey('finishButton'),
                    onPressed: isLoading ? null : _finishSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: isLoading 
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "FINISH",
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
          Expanded(child: Container(height: 1, color: isStep2Done ? AppColors.primary : Colors.grey[300])),
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
            border: Border.all(color: isDone ? AppColors.primary : Colors.grey[300]!, width: 1.5),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(shape: BoxShape.circle, color: isDone ? AppColors.primary : Colors.grey[300]!),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: isDone ? AppColors.primary : Colors.grey, fontWeight: isDone ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildFeeTable() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildFeeRow("1 - 3 Travelers", fee1To3Controller, key: const ValueKey('fee1To3Field')),
          _buildFeeRow("4 - 6 Travelers", fee4To6Controller, key: const ValueKey('fee4To6Field')),
          _buildFeeRow("7 - 9 Travelers", fee7To9Controller, key: const ValueKey('fee7To9Field')),
          _buildFeeRow("10 - 14 Travelers", fee10To14Controller, key: const ValueKey('fee10To14Field'), isLast: true),
        ],
      ),
    );
  }

  Widget _buildFeeRow(String label, TextEditingController controller, {bool isLast = false, Key? key}) {
    return Container(
      key: key,
      decoration: BoxDecoration(border: Border(bottom: isLast ? BorderSide.none : BorderSide(color: Colors.grey[200]!))),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey[200]!))),
              child: Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Input the fee", hintStyle: TextStyle(color: Colors.grey, fontSize: 12), border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: days.map((day) {
          bool isSelected = selectedDay == day;
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(day),
              selected: isSelected,
              onSelected: (val) {
                if (val) setState(() => selectedDay = day);
              },
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontSize: 12),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: isSelected ? AppColors.primary : Colors.grey[200]!)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTimePicker(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
           children: [
             const Icon(Icons.access_time, size: 16, color: Colors.grey),
             const SizedBox(width: 8),
             Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
           ],
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "09:00 AM",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
          ),
        ),
      ],
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';

class EditProfileScreen extends StatefulWidget {
  final int? userId;
  const EditProfileScreen({super.key, this.userId});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  
  String? avatarUrl;
  String? coverPhotoUrl;
  bool isLoading = true;
  bool isSaving = false;
  final ImagePicker _picker = ImagePicker();

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
        final userData = widget.userId != null 
            ? users.firstWhere((u) => u['id'] == widget.userId, orElse: () => users.first)
            : users.first;
        setState(() {
          _firstNameController.text = userData['firstName'] ?? '';
          _lastNameController.text = userData['lastName'] ?? '';
          avatarUrl = userData['avatarUrl'];
          coverPhotoUrl = userData['coverPhotoUrl'];
          isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      setState(() => isLoading = false);
    }
  }

  Future<void> _pickAndUploadImage(bool isAvatar) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() => isSaving = true);
    try {
      final bytes = await image.readAsBytes();
      final response = await ApiService.uploadFile('api/upload', bytes, image.name);
      setState(() {
        if (isAvatar) avatarUrl = response['url'];
        else coverPhotoUrl = response['url'];
        isSaving = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload failed: $e')));
      setState(() => isSaving = false);
    }
  }

  Future<void> _saveProfile() async {
    setState(() => isSaving = true);
    try {
      await ApiService.post('auth/update', {
        'userId': widget.userId ?? 1,
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'avatarUrl': avatarUrl,
        'coverPhotoUrl': coverPhotoUrl,
      });
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save failed: $e')));
      setState(() => isSaving = false);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.black, size: 28), onPressed: () => Navigator.of(context).pop()),
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          if (isSaving) const Center(child: Padding(padding: EdgeInsets.all(16), child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))))
          else TextButton(onPressed: _saveProfile, child: const Text('SAVE', style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold))),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _pickAndUploadImage(false),
              child: Stack(
                children: [
                  Container(
                    height: 150, width: double.infinity, color: Colors.grey[200],
                    child: _ServerImage(url: getFullUrl(coverPhotoUrl), fit: BoxFit.cover, fallbackUrl: ''),
                  ),
                  Positioned(bottom: 10, right: 10, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle), child: const Icon(Icons.edit, color: Colors.white, size: 16))),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 1)),
                    child: ClipOval(child: SizedBox(width: 120, height: 120, child: _ServerImage(url: getFullUrl(avatarUrl), fit: BoxFit.cover, fallbackUrl: 'img/avatar/7.png'))),
                  ),
                  Positioned(bottom: 0, right: 0, child: GestureDetector(onTap: () => _pickAndUploadImage(true), child: Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.camera_alt, color: Colors.white, size: 18))))),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(24), child: Column(children: [const SizedBox(height: 20), Row(children: [Expanded(child: _buildInputField(label: 'First Name', controller: _firstNameController)), const SizedBox(width: 24), Expanded(child: _buildInputField(label: 'Last Name', controller: _lastNameController))])])),
          ],
        ),
      ),
    );
  }

  String getFullUrl(String? path) {
    if (path == null) return '';
    if (path.startsWith('/')) return '${ApiService.baseUrl}$path';
    return path;
  }

  Widget _buildInputField({required String label, required TextEditingController controller}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500)), TextField(controller: controller, decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 8), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))), focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary))))]);
  }
}

class _ServerImage extends StatelessWidget {
  final String url; final BoxFit fit; final String fallbackUrl;
  const _ServerImage({required this.url, required this.fit, required this.fallbackUrl});
  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return fallbackUrl.isEmpty ? const Icon(Icons.add_a_photo, size: 40, color: Colors.grey) : Image.network(fallbackUrl, fit: fit);
    if (!url.contains('/uploads/')) return Image.network(url, fit: fit);
    return FutureBuilder<dynamic>(
      future: ApiService.get(url.replaceFirst(ApiService.baseUrl + '/', '')),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (snapshot.hasError || snapshot.data == null) return const Icon(Icons.error);
        try {
          final data = snapshot.data as Map<String, dynamic>;
          return Image.memory(base64Decode(data['data'] as String), fit: fit);
        } catch (e) { return const Icon(Icons.error); }
      },
    );
  }
}

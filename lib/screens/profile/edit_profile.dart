import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';
import '../../core/widgets/server_image.dart';

class EditProfileScreen extends StatefulWidget {
  final int? userId;
  const EditProfileScreen({super.key, this.userId});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _langController = TextEditingController();
  
  List<String> _languages = [];
  
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
          _bioController.text = userData['bio'] ?? '';
          _languages = (userData['languages'] as List?)?.map((e) => e.toString()).toList() ?? [];
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
        if (isAvatar) {
          avatarUrl = response['url'];
        } else {
          coverPhotoUrl = response['url'];
        }
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
        'introduction': _bioController.text,
        'languages': _languages.join(', '),
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
    _bioController.dispose();
    _langController.dispose();
    super.dispose();
  }

  void _showAddLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Language'),
        content: TextField(
          controller: _langController,
          decoration: const InputDecoration(hintText: 'e.g. Spanish, German'),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          TextButton(
            onPressed: () {
              if (_langController.text.isNotEmpty) {
                setState(() {
                  _languages.add(_langController.text.trim());
                  _langController.clear();
                });
              }
              Navigator.pop(context);
            },
            child: const Text('ADD'),
          ),
        ],
      ),
    );
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
                    child: ServerImage(
                      url: coverPhotoUrl,
                      fit: BoxFit.cover,
                    ),
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
                    child: ClipOval(
                      child: ServerImage(
                        url: avatarUrl,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        fallbackUrl: 'img/avatar/7.png',
                      ),
                    ),
                  ),
                  Positioned(bottom: 0, right: 0, child: GestureDetector(onTap: () => _pickAndUploadImage(true), child: Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.camera_alt, color: Colors.white, size: 18))))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildInputField(label: 'First Name', controller: _firstNameController)),
                      const SizedBox(width: 24),
                      Expanded(child: _buildInputField(label: 'Last Name', controller: _lastNameController)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    label: 'Introduction',
                    controller: _bioController,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Languages',
                    style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ..._languages.map((lang) => Chip(
                            label: Text(lang),
                            onDeleted: () => setState(() => _languages.remove(lang)),
                            deleteIconColor: Colors.red,
                            backgroundColor: Colors.grey[100],
                          )),
                      ActionChip(
                        label: const Icon(Icons.add, size: 20),
                        onPressed: _showAddLanguageDialog,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
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

  Widget _buildInputField({required String label, required TextEditingController controller, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500)),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
          ),
        ),
      ],
    );
  }
}

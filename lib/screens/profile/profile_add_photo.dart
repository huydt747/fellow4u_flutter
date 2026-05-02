import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final List<int> _selectedIndices = [];

  final List<String> _mockImages = [
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?q=80&w=500&auto=format&fit=crop',
  ];

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
          'Add Photos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'DONE',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 1.0,
        ),
        itemCount: _mockImages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildTakePhotoTile();
          }
          final imageIndex = index - 1;
          final isSelected = _selectedIndices.contains(imageIndex);
          return _buildImageTile(imageIndex, isSelected);
        },
      ),
    );
  }

  Widget _buildTakePhotoTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.camera_alt, color: AppColors.primary, size: 30),
          SizedBox(height: 8),
          Text(
            'Take Photo',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageTile(int index, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndices.contains(index)) {
            _selectedIndices.remove(index);
          } else {
            _selectedIndices.add(index);
          }
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(_mockImages[index], fit: BoxFit.cover),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primary
                    : Colors.white.withValues(alpha: 0.2),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.white,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/image_provider.dart';
import 'package:shopywell/data/services/image_services.dart';

class EditableAvatar extends ConsumerWidget {
  const EditableAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(profileImageProvider);

    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.red.shade300,
          backgroundImage: imageFile != null
              ? FileImage(imageFile)
              : const AssetImage('assets/images/avatar.jpg') as ImageProvider,
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => ref.read(imagePickerProvider).pickImage(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.edit, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

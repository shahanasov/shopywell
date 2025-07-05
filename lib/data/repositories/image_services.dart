import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopywell/config/image_provider.dart';

final imagePickerProvider = Provider((ref) => ImagePickerService(ref));

class ImagePickerService {
  final Ref ref;
  final _picker = ImagePicker();

  ImagePickerService(this.ref);

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      ref.read(profileImageProvider.notifier).state = File(picked.path);
    }
  }
}

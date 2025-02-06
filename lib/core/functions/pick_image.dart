import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// الأذونات المطلوبة:
/// Android:
/// - أضف الأذونات التالية إلى AndroidManifest.xml:
/// <uses-permission android:name="android.permission.CAMERA" />
///
/// iOS:
/// - أضف الأذونات التالية إلى Info.plist:
/// <key>NSCameraUsageDescription</key>
/// <string>We need access to your camera to capture photos.</string>
/// <key>NSPhotoLibraryUsageDescription</key>
/// <string>We need access to your photo library to select photos.</string>

class ImageService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({required bool fromCamera}) async {
    try {
      final PickedFile? pickedFile = await _picker.getImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path); // تحويل الصورة إلى ملف
      }
    } catch (e) {
      print("Error picking image: $e");
    }

    return null; // إذا لم يتم اختيار صورة
  }
}

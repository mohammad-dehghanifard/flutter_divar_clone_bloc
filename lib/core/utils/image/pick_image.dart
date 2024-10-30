import 'package:image_picker/image_picker.dart';

class PickImage {
  PickImage._();

  static Future<XFile?> imagePicker(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if(image != null) {
      return image;
    } else {
      return null;
    }
  }
}
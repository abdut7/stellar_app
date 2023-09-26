import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromGalleryOrCamera(
    {ImageSource source = ImageSource.gallery}) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  return pickedFile;
}

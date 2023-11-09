import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/view/create_post/flicks/video_player/video_player_screen.dart';

Future<void> pickVideoFromStorage({required bool isFromChannel}) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.video,
    allowMultiple: false,
  );

  if (result != null) {
    // Handle the selected video file(s) here.
    final file = result.files.single;
    if (file.path != null) {
      Get.to(() => VideoPlayerScreen(
            videoFilePath: file.path!,
            isFromChannel: isFromChannel,
          ));
      print('Selected video path: ${file.path}');
    }
  } else {
    // User canceled file selection.
    print('No video file selected.');
  }
}

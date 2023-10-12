import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData, Response;
import 'package:stellar_chat/controllers/new_post/fliq_controller.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';

class UploadFileService {
  static Future<String?> uploadFile(
      {required List<String> filePaths, bool isFromFlicks = false}) async {
    FliqController fliqController = Get.find();
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.filesUpload;
    Map<String, dynamic> header = await getHeader();
    try {
      final List<MultipartFile> files =
          filePaths.map((path) => MultipartFile.fromFileSync(path)).toList();

      final FormData formData = FormData.fromMap({
        'arrFiles': files,
      });
      // Map<String, String> data = {"strSearch": query};
      Response res = await dio.post(
        url,
        data: formData,
        options: Options(headers: header),
        onSendProgress: (int sent, int total) {
          if (total != -1) {
            // Calculate and notify the progress percentage
            final progress = ((sent / total) * 100).toInt();
            fliqController.uploadPercentage(progress);
          }
        },
      );
      return res.data['arrUrls'][0];
    } catch (e) {
      print(e);
    }
  }
}

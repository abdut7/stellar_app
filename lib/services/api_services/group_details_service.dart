import 'package:base_project/models/group_chat/group_details_model.dart';
import 'package:dio/dio.dart';

import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';

class GroupDetailsService {
  static Future<GroupDetailsResponseModel?> getGroupDetails(
    {required String groupId}
  ) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getGroupDetails;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"strGroupId": groupId};
    try {
      Response response =
          await dio.post(path, options: Options(headers: header), data: body);
      print(response);
      GroupDetailsResponseModel model =
          GroupDetailsResponseModel.fromJson(response.data);
      return model;
    } on Exception catch (e) {
      // TODO
      return null;
    }
  }
}

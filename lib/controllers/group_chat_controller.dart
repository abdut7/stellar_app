import 'package:get/get.dart';

import '../models/group_chat/group_message_model.dart';

class GroupChatController extends GetxController {
  RxList<GroupMessageModel> groupMessageList = RxList([
    // GroupMessageModel(
    //     id: "id",
    //     strUserId: "strUserId",
    //     strType: "strType",
    //     strMessage: "Hello 1",
    //     strMessageType: "text",
    //     strName: "you",
    //     strIconURL: "strIconURL",
    //     strCreatedTime: "2.34"),
    // GroupMessageModel(
    //     id: "id",
    //     strUserId: "strUserId",
    //     strType: "strType",
    //     strMessage: "Hello 1",
    //     strMessageType: "text",
    //     strName: "Aju",
    //     strIconURL: "strIconURL",
    //     strCreatedTime: "2.34"),
    // GroupMessageModel(
    //     id: "id",
    //     strUserId: "strUserId",
    //     strType: "strType",
    //     strMessage: "Hello 1",
    //     strMessageType: "text",
    //     strName: "Aswin",
    //     strIconURL: "strIconURL",
    //     strCreatedTime: "2.34")
  ]);
  RxBool isLoading = RxBool(false);
  RxBool isErrorOccured = RxBool(false);
}

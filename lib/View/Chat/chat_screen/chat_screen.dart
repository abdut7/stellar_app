import 'package:base_project/View/Chat/chat_screen/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_appbar_title_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_bubble.dart';
import 'package:base_project/controllers/private_chat_controller.dart';
import 'package:base_project/models/private_chat/private_chat_model.dart';
import 'package:base_project/services/api_services/chat_message_service.dart';
import 'package:base_project/services/socket_service/private_chat_service.dart';
import 'package:base_project/utils/uid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'model/message_model.dart';
import '../../../../../models/api_models/get_contacts_model.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final ObjUser user;
  final String token;
  const ChatScreen(
      {super.key,
      required this.user,
      required this.token,
      required this.chatId});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ChatMessageService.getMessages(widget.chatId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PrivateChatController chatController = Get.put(PrivateChatController());
    return Scaffold(
      appBar: AppBar(
        title: ChatAppBarTitleWidget(
          isOnline: false,
          name: widget.user.strFullName,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Handle video call
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Handle voice call
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {
              // Handle more
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Obx(() {
            return Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: chatController.messageList.length,
                itemBuilder: (context, index) {
                  final reversedIndex =
                      chatController.messageList.length - 1 - index;
                  return ChatBubble(
                    message:
                        chatController.messageList.elementAt(reversedIndex),
                  );
                },
              ),
            );
          }),
          ChatBottomFieldSent(
              controller: controller,
              onsent: () {
                if (controller.text.isNotEmpty) {
                  PrivateChatService.sentPersonalTextMessage(
                      widget.chatId, controller.text.trim());
                  chatController.messageList.add(PrivateMessageModel(
                      id: "",
                      strUserId: globalUid!,
                      strType: "private",
                      strMessageType: "text",
                      strMessage: controller.text.trim(),
                      strName: "strName",
                      strIconURL: "",
                      strCreatedTime:
                          DateFormat('HH:mm').format(DateTime.now())));
                  controller.clear();
                }
              },
              onCamera: () {},
              onAttach: () {})
        ],
      ),
    );
  }
}

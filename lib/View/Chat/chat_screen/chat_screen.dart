import 'package:stellar_chat/View/chat/chat_screen/widgets/chat_appbar_title_widget.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/chat_bubble.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/report_and_bloc_sheet_widget.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/show_attachment.dart';
import 'package:stellar_chat/View/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/controllers/private_chat_controller.dart';
import 'package:stellar_chat/services/api_services/chat_message_service.dart';
import 'package:stellar_chat/services/socket_service/private_chat_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../functions/pick_image.dart';
import '../widgets/bottom_field_sent_widget.dart';
import 'model/message_model.dart';

class PrivateChatScreen extends StatefulWidget {
  final String chatId;
  final String fullName;
  final String imageUrl;
  const PrivateChatScreen(
      {super.key,
      required this.chatId,
      required this.fullName,
      required this.imageUrl});

  @override
  // ignore: library_private_types_in_public_api
  _PrivateChatScreenState createState() => _PrivateChatScreenState();
  final isBlocked = false;
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  final List<Message> messages = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ChatMessageService.getMessages(chatId: widget.chatId, type: "private");
  }

  @override
  void dispose() {
    print("dispose run");
    PrivateChatController chatController = Get.put(PrivateChatController());
    chatController.messageList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PrivateChatController chatController = Get.put(PrivateChatController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(159, 196, 232, 1),
        elevation: 0,
        title: InkWell(
          onTap: () {
            Get.to(() => PublicProfileScreen(
                  uid: widget.chatId,
                  isFromChatScreen: true,
                ));
          },
          child: ChatAppBarTitleWidget(
            profileImage: widget.imageUrl.isEmpty ? null : widget.imageUrl,
            isOnline: false,
            name: widget.fullName,
          ),
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
              showBlockAndReportBottomSheet(context, widget.chatId);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Obx(() {
            print("Added new message");
            return Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
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
                ],
              ),
            );
          }),
          ChatBottomFieldSent(
              chatId: widget.chatId,
              controller: controller,
              onsent: () async {
                if (controller.text.isNotEmpty) {
                  PrivateChatService.sentPersonalTextMessage(
                      widget.chatId, controller.text.trim());

                  controller.clear();
                }
              },
              onCamera: () async {
                XFile? image = await pickImageFromGalleryOrCamera(
                    source: ImageSource.camera);
                if (image != null) {
                  PrivateChatService.sentPersonalImageMessage(
                      widget.chatId, image);
                }
              },
              onAttach: () {
                show_attachment(
                  context,
                  (index) async {
                    //if index = 0 =>Send Files
                    //if index = 1 =>Camera
                    if (index == 1) {
                      XFile? image = await pickImageFromGalleryOrCamera(
                          source: ImageSource.camera);
                      if (image != null) {
                        PrivateChatService.sentPersonalImageMessage(
                            widget.chatId, image);
                      }
                    }
                    //if index = 2 =>Gallary
                    if (index == 2) {
                      XFile? image = await pickImageFromGalleryOrCamera(
                          source: ImageSource.gallery);
                      if (image != null) {
                        PrivateChatService.sentPersonalImageMessage(
                            widget.chatId, image);
                      }
                    }
                    //if index = 3 =>Location
                    //if index = 4 =>Contacts
                    //if index = 5 =>Audio
                    Navigator.pop(context);
                  },
                );
              })
        ],
      ),
    );
  }
}

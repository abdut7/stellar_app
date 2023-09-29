import 'package:base_project/View/chat/group_chat/group_info/group_info_screen.dart';
import 'package:base_project/View/chat/group_chat/widgets/group_chat_bubble.dart';
import 'package:base_project/View/chat/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/controllers/group_chat_controller.dart';
import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:base_project/models/group_chat/group_message_model.dart';
import 'package:base_project/services/api_services/group_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GroupChatScreen extends StatefulWidget {
  final ChatHistoryList chatHistoryList;
  GroupChatScreen({super.key, required this.chatHistoryList});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  TextEditingController messageConteroller = TextEditingController();

  GroupChatController groupChatController = Get.put(GroupChatController());

  @override
  void initState() {
    super.initState();
    GroupServices.getGroupMessage(groupId: widget.chatHistoryList.strChatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(159, 196, 232, 1),
        title: GestureDetector(
          onTap: () {
            Get.to(() => GroupInfoScreen(
                  chatId: widget.chatHistoryList.strChatId,
                ));
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.chatHistoryList.strIconURL),
                radius: 20.0, // Adjust the size of the circle avatar as needed
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatHistoryList.strName,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'User 1, User 2',
                  //   style: TextStyle(fontSize: 12.0),
                  // ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Implement your menu actions here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Obx(() {
            if (groupChatController.isErrorOccured.value) {
              return const Expanded(
                child: Center(
                  child: Text("Error occured while loading"),
                ),
              );
            }
            if (groupChatController.isLoading.value) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (groupChatController.groupMessageList.isEmpty) {
              return const Spacer();
            }

            return Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: groupChatController.groupMessageList.length,
                  itemBuilder: (context, index) {
                    GroupMessageModel model =
                        groupChatController.groupMessageList[index];
                    return GroupChatBubble(
                      senderName: model.strName,
                      message: model.strMessage,
                      alignment: model.strName == 'you'
                          ? BubbleAlignment.right
                          : BubbleAlignment
                              .left, // Change to BubbleAlignment.right for the sender's messages
                    );
                  },
                ));
          }),

          // Message input field
          ChatBottomFieldSent(
            chatId: widget.chatHistoryList.id,
            controller: messageConteroller,
            onsent: () {},
            onCamera: () {},
            onAttach: () {},
          )
        ],
      ),
    );
  }
}

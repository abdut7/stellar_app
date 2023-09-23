import 'package:base_project/View/chat/group_chat/group_info/group_info_screen.dart';
import 'package:base_project/View/chat/group_chat/widgets/group_chat_bubble.dart';
import 'package:base_project/View/chat/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/controllers/group_chat_controller.dart';
import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:base_project/models/group_chat/group_message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GroupChatScreen extends StatelessWidget {
  final ChatHistoryList chatHistoryList;
  GroupChatScreen({super.key, required this.chatHistoryList});

  TextEditingController messageConteroller = TextEditingController();
  GroupChatController groupChatController = Get.put(GroupChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(159, 196, 232, 1),
        title: GestureDetector(
          onTap: () {
            Get.to(() => GroupInfoScreen(
                  chatHistoryList: chatHistoryList,
                ));
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(chatHistoryList.strIconURL),
                radius: 20.0, // Adjust the size of the circle avatar as needed
              ),
              const SizedBox(width: 10.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group Name',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
              return const Center(child: Text("Error occured while loading"));
            }
            if (groupChatController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
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

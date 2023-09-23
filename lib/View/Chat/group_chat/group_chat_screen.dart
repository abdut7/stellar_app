import 'package:base_project/View/chat/group_chat/group_info/group_info_screen.dart';
import 'package:base_project/View/chat/group_chat/widgets/group_chat_bubble.dart';
import 'package:base_project/View/chat/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GroupChatScreen extends StatelessWidget {
  final ChatHistoryList chatHistoryList;
  GroupChatScreen({super.key, required this.chatHistoryList});

  TextEditingController messageConteroller = TextEditingController();

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
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group Name',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'User 1, User 2',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement your menu actions here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            flex: 5,
            child: ListView(
              // Replace this with your chat messages data
              children: [
                GroupChatBubble(
                  senderName: 'User 1',
                  message: 'Hello, how are you?',
                  alignment: BubbleAlignment
                      .left, // Change to BubbleAlignment.right for the sender's messages
                ),
                GroupChatBubble(
                  senderName: 'User 2',
                  message: 'Hello, how are you?',
                  alignment: BubbleAlignment
                      .right, // Change to BubbleAlignment.right for the sender's messages
                ),

                GroupChatBubble(
                  senderName: 'User 1',
                  message: 'Hello, how are you?',
                  alignment: BubbleAlignment
                      .left, // Change to BubbleAlignment.right for the sender's messages
                ),

                GroupChatBubble(
                  senderName: 'User 3',
                  message: 'Hello, how are you?',
                  alignment: BubbleAlignment
                      .right, // Change to BubbleAlignment.right for the sender's messages
                ),

                // Add more chat messages here
              ],
            ),
          ),

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

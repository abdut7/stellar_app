import 'package:base_project/View/Chat/chat_screen/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_appbar_title_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

import 'model/message_model.dart';
import '../../../../../models/api_models/get_contacts_model.dart';

class ChatScreen extends StatefulWidget {
  final ObjUser user;
  const ChatScreen({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final reversedIndex = messages.length - 1 - index;
                final message = messages[reversedIndex];
                return ChatBubble(message: message);
              },
            ),
          ),
          ChatBottomFieldSent(
              controller: controller,
              onsent: () {
                setState(() {
                  messages.add(Message(controller.text));
                });
                controller.clear();
              },
              onCamera: () {},
              onAttach: () {})
        ],
      ),
    );
  }
}

import 'package:base_project/View/Chat/chat_screen/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_appbar_title_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_bubble.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:flutter/material.dart';

import 'model/message_model.dart';
import '../../../../../models/api_models/get_contacts_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  final ObjUser user;
  final String token;
  const ChatScreen({super.key, required this.user, required this.token});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket _socket;
  final List<Message> messages = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _socket = IO.io(
      'https://8536-2409-40f4-6-a1b1-d9fd-2e9f-1dcf-f95e.ngrok-free.app/',
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {'token': widget.token}).build(),
    );
    _connectSocket();
  }

  _connectSocket() {
    _socket.onConnect((data) => print('Connection established'));
    _socket.onConnectError((data) => print('Connect Error: $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
  }

  @override
  void dispose() {
    super.dispose();
    _socket.disconnected;
  }

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

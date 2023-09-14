import 'package:base_project/View/Chat/chat_screen/widgets/bottom_field_sent_widget.dart';
import 'package:base_project/View/Chat/chat_screen/widgets/chat_appbar_title_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ChatAppBarTitleWidget(
          isOnline: false,
          name: "Joel",
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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          ChatBottomFieldSent(
              controller: controller,
              onsent: () {},
              onCamera: () {},
              onAttach: () {})
        ],
      ),
    );
  }

  TextEditingController _controller = TextEditingController();

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, Message(text));
        _controller.clear();
      });
    }
  }
}

class Message {
  final String text;
  final DateTime timestamp;
  final bool isSent;
  final bool isDelivered;

  Message(this.text, {this.isSent = true, this.isDelivered = false})
      : timestamp = DateTime.now();
}

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.isSent;
    final alignment =
        isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isSent ? const Color(0xFF243E87) : Colors.grey;

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment:
                isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '${message.timestamp.hour}:${message.timestamp.minute}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 4.0),
              if (isSent)
                Icon(
                  message.isDelivered ? Icons.done_all : Icons.done,
                  color: Colors.grey,
                  size: 16.0,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

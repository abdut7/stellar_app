import 'package:base_project/utils/uid.dart';
import 'package:flutter/material.dart';

import '../../../../models/private_chat/private_chat_model.dart';

class ChatBubble extends StatelessWidget {
  final PrivateMessageModel message;

  ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.strUserId == globalUid;
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
              borderRadius: BorderRadius.only(
                  bottomRight: !isSent
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  bottomLeft: isSent
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message.strMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment:
                isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Text(
                message.strCreatedTime,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 4.0),
              if (isSent)
                Icon(
                  true ? Icons.done_all : Icons.done,
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

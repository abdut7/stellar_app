import 'package:flutter/material.dart';

import '../model/message_model.dart';

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

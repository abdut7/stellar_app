import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../chat_screen/chat_screen.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String avatarUrl;
  final String chatId;
  final VoidCallback ontap;

  const ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
    required this.chatId,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
        radius: 30, // Adjust the size of the avatar
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          const Icon(
            Icons.check,
            size: 18,
            color: Colors.grey,
          ),
          const SizedBox(width: 4),
          Text(message),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          if (unreadCount > 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.green, // You can use a different color
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        // Handle tapping on the chat list tile
        ontap();
      },
    );
  }
}

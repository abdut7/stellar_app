import 'package:flutter/material.dart';

enum BubbleAlignment { left, right }

class GroupChatBubble extends StatelessWidget {
  final String senderName;
  final String message;
  final BubbleAlignment alignment;

  GroupChatBubble({
    required this.senderName,
    required this.message,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment == BubbleAlignment.left
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          alignment == BubbleAlignment.right
              ? const SizedBox()
              : Text(
                  senderName,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: alignment == BubbleAlignment.left
                  ? Colors.white
                  : const Color(0xFFE9F4FF),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0),
                bottomLeft: alignment == BubbleAlignment.right
                    ? const Radius.circular(12.0)
                    : const Radius.circular(0.0),
                bottomRight: alignment == BubbleAlignment.left
                    ? const Radius.circular(12.0)
                    : const Radius.circular(0.0),
              ),
              boxShadow: alignment == BubbleAlignment.left
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 2.0,
                        offset: const Offset(1.0, 1.0),
                      ),
                    ]
                  : [],
            ),
            child: Text(
              message,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String sender;
  final String text;
  final bool isSent;

  ChatMessage({required this.sender, required this.text, required this.isSent});

  @override
  Widget build(BuildContext context) {
    final messageColor = isSent
        ? Color(0xFFE9F4FF)
        : Colors.white; // Adjust the colors as per your requirements

    final boxShadow = isSent
        ? []
        : [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2.0,
              offset: Offset(1.0, 1.0),
            ),
          ];

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: messageColor,
        borderRadius: BorderRadius.circular(8.0),
        // boxShadow: boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}

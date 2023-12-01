import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';

class WelcomeChatContainer extends StatefulWidget {
  @override
  _WelcomeChatContainerState createState() => _WelcomeChatContainerState();
}

class _WelcomeChatContainerState extends State<WelcomeChatContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            SSvgs.sv05,
            height: 50,
            width: 50,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _buildChatInfoRow(),
                const Text(
                  'WELCOME TO STELLAR CHAT IF YOU HAVE THE',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'STELLAR CHAT TEAM',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          'NOW',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Inter',
            color: SColors.color9,
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

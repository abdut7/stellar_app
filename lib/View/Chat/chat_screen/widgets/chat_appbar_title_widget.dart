import 'package:flutter/material.dart';

class ChatAppBarTitleWidget extends StatelessWidget {
  final String name;
  final bool isOnline;
  final String? profileImage;

  const ChatAppBarTitleWidget({
    super.key,
    required this.name,
    required this.isOnline,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        profileImage == null
            ? const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(profileImage!),
                radius: 20,
              ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

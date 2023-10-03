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
                backgroundImage: NetworkImage(
                    profileImage!), // Replace with the user's image
                radius: 20,
              ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name, // Replace with the user's name
              style: const TextStyle(fontSize: 16),
            ),
            // Row(
            //   children: <Widget>[
            //     Container(
            //       width: 8,
            //       height: 8,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: isOnline ? Colors.green : Colors.red,
            //       ),
            //     ),
            //     const SizedBox(width: 4.0),
            //     Text(
            //       isOnline ? 'Online' : 'Offline',
            //       style: const TextStyle(fontSize: 12, color: Colors.grey),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}

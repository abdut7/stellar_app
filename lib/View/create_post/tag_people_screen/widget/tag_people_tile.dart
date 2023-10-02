import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class TagPeopleTile extends StatefulWidget {
  final String username;
  final String name;
  const TagPeopleTile({Key? key, required this.username, required this.name})
      : super(key: key);

  @override
  State<TagPeopleTile> createState() => _TagPeopleTileState();
}

class _TagPeopleTileState extends State<TagPeopleTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: SColors.color9,
          radius: 25,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380',
          ),
        ),
        title: Text(
          widget.username,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          widget.name,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.cancel,
          color: SColors.color3,
          size: 20,
        ),
        onTap: () {},
      ),
    );
  }
}

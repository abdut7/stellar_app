import 'package:flutter/material.dart';

class SendReceiveContactsListTile extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const SendReceiveContactsListTile({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SendReceiveContactsListTile> createState() =>
      _SendReceiveContactsListTileState();
}

class _SendReceiveContactsListTileState
    extends State<SendReceiveContactsListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: ListTile(
        onTap: widget.onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdn.quotesgram.com/img/8/72/1135141999-074f6884b9f34be89538782d2fc98f8e.jpg'), // Replace with your avatar image URL
            ),
          ),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontFamily: 'Inter',
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

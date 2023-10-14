import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class ProfileStatus extends StatefulWidget {
  final String count;
  final String label;

  ProfileStatus({required this.count, required this.label});

  @override
  _ProfileStatusState createState() => _ProfileStatusState();
}

class _ProfileStatusState extends State<ProfileStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.count,
          style: TextStyle(
            // color: SColors.color3,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          widget.label,
          style: TextStyle(
            // color: SColors.color3,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

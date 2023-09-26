import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class ContactThrough extends StatefulWidget {
  final String svgAsset;
  final String label;

  ContactThrough({required this.svgAsset, required this.label});

  @override
  _ContactThroughState createState() => _ContactThroughState();
}

class _ContactThroughState extends State<ContactThrough> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            widget.svgAsset,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 8),
          Text(
            widget.label,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

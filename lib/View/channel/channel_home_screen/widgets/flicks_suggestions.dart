import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class FlickSuggestions extends StatelessWidget {
  final String? thumbnileUrl;
  FlickSuggestions({required this.thumbnileUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(thumbnileUrl == null
                ? 'https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'
                : thumbnileUrl!),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10), // Circular border radius
        color: SColors.color9,
      ),
    );
  }
}

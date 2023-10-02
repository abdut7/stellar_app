import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class FlickSuggestions extends StatefulWidget {
  FlickSuggestions();

  @override
  State<FlickSuggestions> createState() => _FlickSuggestionsState();
}

class _FlickSuggestionsState extends State<FlickSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10), // Circular border radius
        color: SColors.color9,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Captions',
                        style: TextStyle(color: SColors.color3, fontSize: 10)),
                    Text('Views',
                        style: TextStyle(color: SColors.color3, fontSize: 10)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

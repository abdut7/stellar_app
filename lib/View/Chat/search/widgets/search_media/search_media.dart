import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class SearchMediaScreen extends StatefulWidget {
  const SearchMediaScreen({super.key});
  @override
  State<SearchMediaScreen> createState() => _SearchMediaScreenState();
}

class _SearchMediaScreenState extends State<SearchMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
      ),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              child: Icon((Icons.photo), color: Colors.grey),
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: SColors.color9.withOpacity(0.4),
              ),
            ),
          ),
        );
      },
    );
  }
}

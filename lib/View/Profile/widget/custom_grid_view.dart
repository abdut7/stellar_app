import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10,),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: (){},
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: SColors.color9.withOpacity(0.4),
              ),
            ),
          ),
        );
      },
    );
  }
}

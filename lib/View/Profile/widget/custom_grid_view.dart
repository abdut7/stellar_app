import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  final IconData? icon;

  CustomGridView({this.icon});

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                child: widget.icon != null
                    ? Icon(widget.icon, color: Colors.grey)
                    : null,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: SColors.color9.withOpacity(0.4),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class FavoriteGridViewTab1 extends StatefulWidget {
  final IconData? icon;

  FavoriteGridViewTab1({this.icon});

  @override
  _FavoriteGridViewTab1State createState() => _FavoriteGridViewTab1State();
}

class _FavoriteGridViewTab1State extends State<FavoriteGridViewTab1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: SColors.color9.withOpacity(0.4),
                  ),
                  child: Icon(
                    widget.icon,
                    color: Colors.grey.withOpacity(0.7),
                    size: 20,
                  ),
                )),
          );
        },
      ),
    );
  }
}

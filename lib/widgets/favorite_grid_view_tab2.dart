import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class FavoriteGridViewTab2 extends StatefulWidget {

  FavoriteGridViewTab2();

  @override
  _FavoriteGridViewTab2State createState() => _FavoriteGridViewTab2State();
}

class _FavoriteGridViewTab2State extends State<FavoriteGridViewTab2> {
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
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2,childAspectRatio: (2/1)),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: SColors.color9.withOpacity(0.4),
                  ),
                )),
          );
        },
      ),
    );
  }
}

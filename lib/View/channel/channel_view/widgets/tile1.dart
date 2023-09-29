import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class Tile1 extends StatefulWidget {
  const Tile1({Key? key}) : super(key: key);

  @override
  State<Tile1> createState() => _Tile1State();
}

class _Tile1State extends State<Tile1> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: SColors.color9,
          image: const DecorationImage(image: NetworkImage('https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'),fit: BoxFit.cover),
        ),
      ),
      title: Text(
        'Voice of Books',
        style: TextStyle(
          color: SColors.color3, fontSize: 16, fontWeight: FontWeight.w400,),),
      subtitle: Text(
        '289K subscribers',
        style: TextStyle(color:SColors.color9, fontSize: 12, fontWeight: FontWeight.w600,),
      ),
      trailing:
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up_alt_outlined, size: 20),
                onPressed: () { },
              ),
              Expanded(
                child: Text(
                  '25.6K',
                  style: TextStyle(fontSize: 8,color: SColors.color8),
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_down_alt_outlined, size: 20),
                onPressed: () {},
              ),
              Expanded(
                child: Text(
                  '65',
                  style: TextStyle(fontSize: 8,color: SColors.color8),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}

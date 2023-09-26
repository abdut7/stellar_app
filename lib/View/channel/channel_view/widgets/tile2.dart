import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/channel/channel_view/widgets/reply_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Tile2 extends StatefulWidget {
  const Tile2({Key? key}) : super(key: key);

  @override
  State<Tile2> createState() => _Tile2State();
}

class _Tile2State extends State<Tile2> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: SColors.color9,
          image: const DecorationImage(image: NetworkImage('URL_TO_YOUR_IMAGE'),fit: BoxFit.cover),
        ),
      ),
      title: Text(
        'martini_rond',
        style: TextStyle(color: SColors.color8, fontSize: 13, fontWeight: FontWeight.w400,),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How neatly I write the date in my book',
            style: TextStyle(
              color: SColors.color3, fontSize: 15, fontWeight: FontWeight.w400,),
          ),
          Row(
            children: [
              Text(
                'View replies (4)',
                style: TextStyle(color:  SColors.color9, fontSize: 11, fontWeight: FontWeight.w600,),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down, size: 20),
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
            ],
          ),
        ],
      ),
      trailing:
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '22h',
            style: TextStyle(color:  SColors.color9, fontSize: 13, fontWeight: FontWeight.w400,),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.heart, size: 20),
                onPressed: () {},
              ),
              Expanded(
                child: Text('25.2K', style: TextStyle(fontSize: 8, color: SColors.color8),),
              )
            ],
          )

        ],
      ),

    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return const  Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(15.0),
            child: Tile2(),
          ),
          ReplyTile(),
          SizedBox(height: 10,),
          ReplyTile(),
          SizedBox(height: 10,),
          ReplyTile()
        ],
      );
    },
  );
}



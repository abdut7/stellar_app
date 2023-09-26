import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/comment_view/reply_tile.dart';
import 'package:base_project/View/comment_view/show_comment_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTile extends StatefulWidget {
  const MainTile({Key? key}) : super(key: key);

  @override
  State<MainTile> createState() => _MainTileState();
}

class _MainTileState extends State<MainTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: SColors.color9,
          image: const DecorationImage(
              image: NetworkImage('URL_TO_YOUR_IMAGE'), fit: BoxFit.cover),
        ),
      ),
      title: Text(
        'martini_rond',
        style: TextStyle(
          color: SColors.color8,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How neatly I write the date in my book',
            style: TextStyle(
              color: SColors.color3,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Text(
                'View replies (4)',
                style: TextStyle(
                  color: SColors.color9,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down, size: 20),
                onPressed: () {
                  showCommentBottomSheet(context);
                },
              ),
            ],
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '22h',
            style: TextStyle(
              color: SColors.color9,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.heart, size: 20),
                onPressed: () {},
              ),
              Expanded(
                child: Text(
                  '25.2K',
                  style: TextStyle(fontSize: 8, color: SColors.color8),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

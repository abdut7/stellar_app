import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReplyTile extends StatefulWidget {
  const ReplyTile({Key? key}) : super(key: key);

  @override
  State<ReplyTile> createState() => _Tile3State();
}

class _Tile3State extends State<ReplyTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListTile(
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
          'No Pressue',
          style: TextStyle(color: SColors.color8, fontSize: 13, fontWeight: FontWeight.w400,),
        ),
        subtitle: Row(
          children: [
            Text(
              'View replies (4)',
              style: TextStyle(color:  SColors.color9, fontSize: 11, fontWeight: FontWeight.w600,),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down, size: 20),
              onPressed: () {},
            ),
          ],
        ),
        trailing:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '22h',
              style: TextStyle(color:  SColors.color9, fontSize: 13, fontWeight: FontWeight.w500,),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.heart, size: 20),
                  onPressed: () {},
                ),
                Expanded(
                  child: Text('20.2K', style: TextStyle(fontSize: 8, color: SColors.color8),),
                )
              ],
            )
          ],
        ),

      ),
    );
  }
}

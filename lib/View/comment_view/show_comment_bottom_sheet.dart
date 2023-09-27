import 'package:base_project/View/comment_view/reply_tile.dart';
import 'package:base_project/View/comment_view/main_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Settings/SColors.dart';

void showCommentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('579 Comments'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: MainTile(),
                    ),
                    ReplyTile(),
                    SizedBox(height: 10,),
                    ReplyTile(),
                    SizedBox(height: 10,),
                    ReplyTile(),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: MainTile(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "Add Comments",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: SColors.color9,
                          backgroundImage: NetworkImage(''),
                        ),
                      ),
                      border: InputBorder.none,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon:  Icon(CupertinoIcons.at,color: SColors.color11,),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.emoji_emotions_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0, right: 10,
            child: IconButton(
              icon: Icon(Icons.cancel_outlined,color: SColors.color3,),
              onPressed: () {},
            ),
          ),
        ],
      );
    },
  );
}
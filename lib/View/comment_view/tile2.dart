import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/comment_view/reply_tile.dart';
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



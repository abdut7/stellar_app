import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/comment_view/functions/get_time_as_ago.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

class MainTile extends StatefulWidget {
  final String likeCount;
  final String commenterName;
  final String commenterProfileUrl;
  final String comment;
  final String time;
  final bool isLiked;
  final String id;
  Function(bool) onLiked;
  final String flickId;
  MainTile(
      {Key? key,
      required this.commenterName,
      required this.commenterProfileUrl,
      required this.comment,
      required this.time,
      required this.isLiked,
      required this.onLiked,
      required this.id,
      required this.flickId,
      required this.likeCount})
      : super(key: key);

  @override
  State<MainTile> createState() => _MainTileState();
}

class _MainTileState extends State<MainTile> {
  int likeCount = 0;
  late bool isLiked;
  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = int.parse(widget.likeCount);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: SColors.color9,
          image: DecorationImage(
              image: NetworkImage(widget.commenterProfileUrl),
              fit: BoxFit.cover),
        ),
      ),
      title: Text(
        widget.commenterName,
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
            widget.comment,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          // Row(
          //   children: [
          //     Text(
          //       'View replies (4)',
          //       style: TextStyle(
          //         color: SColors.color9,
          //         fontSize: 11,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.arrow_drop_down, size: 20),
          //       onPressed: () {
          //         showCommentBottomSheet(context, 10, "");
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatTimeDifference(widget.time),
            style: TextStyle(
              color: SColors.color9,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: isLiked
                    ? const Icon(
                        CupertinoIcons.heart_fill,
                        size: 20,
                        color: Colors.red,
                      )
                    : const Icon(CupertinoIcons.heart, size: 20),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                    if (isLiked) {
                      likeCount++;
                    } else {
                      likeCount--;
                    }
                  });

                  widget.onLiked(!isLiked);
                },
              ),
              Expanded(
                child: Text(
                  likeCount.toString(),
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

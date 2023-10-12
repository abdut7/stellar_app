import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:stellar_chat/View/comment_view/main_tile.dart';
import 'package:stellar_chat/View/comment_view/reply_tile.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/comment_model.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

import '../../Settings/SColors.dart';

void showCommentBottomSheet(
    BuildContext context, int commentCount, String commentId) {
  TextEditingController commentController = TextEditingController();
  UserController userController = Get.find();
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      FliqServices().getComments(id: commentId);
      return CommentScreen(
        commentController: commentController,
        userController: userController,
        commentCount: commentCount,
        commentId: commentId,
      );
    },
  );
}

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    Key? key,
    required this.commentController,
    required this.userController,
    required this.commentCount,
    required this.commentId,
  }) : super(key: key);

  final TextEditingController commentController;
  final UserController userController;
  final int commentCount;
  final String commentId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FliqServices().getComments(id: widget.commentId),
        builder: (context, AsyncSnapshot<CommentResponseModel?> snapshot) {
          return Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('${widget.commentCount} Comments'),
                    ),
                  ),
                  !snapshot.hasData || snapshot.data == null
                      ? Spacer()
                      : Expanded(
                          child: ListView.builder(
                          itemCount: snapshot.data!.arrList.length,
                          itemBuilder: (context, index) {
                            CommentItem commentItem =
                                snapshot.data!.arrList.elementAt(index);
                            return MainTile(
                              id: commentItem.id,
                              comment: commentItem.strComment,
                              commenterName: commentItem.userDetails.strName,
                              isLiked: false,
                              flickId: commentItem.strFlickId,
                              onLiked: () {
                                print("like pressed");
                              },
                              time: commentItem.strCreatedTime,
                              commenterProfileUrl:
                                  "https://loremflickr.com/cache/resized/65535_52627441448_842afe99e3_z_640_360_nofilter.jpg",
                            );
                          },
                        )
                          //  ListViewB(
                          //   children: [
                          //     MainTile(
                          //       id: "myid",
                          //       comment: "This is my comment",
                          //       commenterName: "Joel Mathew",
                          //       isLiked: true,
                          //       onLiked: () {
                          //         print("like pressed");
                          //       },
                          //       time: "22hr",
                          //       commenterProfileId:
                          //           "https://loremflickr.com/cache/resized/65535_52627441448_842afe99e3_z_640_360_nofilter.jpg",
                          //     ),
                          //     // Padding(
                          //     //   padding: EdgeInsets.all(10.0),
                          //     //   child: MainTile(),
                          //     // ),
                          //     // ReplyTile(),
                          //     // SizedBox(
                          //     //   height: 10,
                          //     // ),
                          //     // ReplyTile(),
                          //     // SizedBox(
                          //     //   height: 10,
                          //     // ),
                          //     // ReplyTile(),
                          //     // Padding(
                          //     //   padding: EdgeInsets.all(10.0),
                          //     //   child: MainTile(),
                          //     // ),
                          //   ],
                          // ),
                          ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        controller: widget.commentController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          hintText: "Add Comments",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: SColors.color9,
                              backgroundImage: NetworkImage(widget
                                  .userController
                                  .userDetailsModel
                                  .value!
                                  .strProfileUrl),
                            ),
                          ),
                          border: InputBorder.none,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  CupertinoIcons.at,
                                  color: SColors.color11,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: SvgPicture.string(
                                    """<svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M23.8731 12.0131C23.8731 12.8648 23.3236 13.6231 22.3681 14.1015L3.21147 23.6798C2.74481 23.9131 2.28981 24.0298 1.86981 24.0298C1.26197 24.0298 0.726474 23.7731 0.386974 23.3193C0.0964737 22.9215 -0.183526 22.2331 0.154807 21.1131L2.31314 13.9148C2.38314 13.7048 2.42981 13.4493 2.45314 13.1798H14.2715C14.9131 13.1798 15.4381 12.6548 15.4381 12.0131C15.4381 11.3715 14.9131 10.8465 14.2715 10.8465H2.45314C2.42864 10.5781 2.38197 10.3215 2.31314 10.1115L0.154807 2.91313C-0.183526 1.79313 0.0964737 1.1048 0.38814 0.708129C0.959807 -0.0618716 2.04481 -0.236871 3.21147 0.346462L22.3693 9.9248C23.3248 10.4031 23.8731 11.1615 23.8731 12.0131Z" fill="#00338E"/>
    </svg>
    """),
                                onPressed: () async {
                                  await FliqServices().addComments(
                                    flickId: widget.commentId,
                                    comment: widget.commentController.text,
                                  );
                                  widget.commentController.clear();
                                  setState(() {});
                                },
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
                top: 0,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: SColors.color3,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          );
        });
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:stellar_chat/View/comment_view/main_tile.dart';
import 'package:stellar_chat/View/comment_view/reply_tile.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/comment_model.dart';
import 'package:stellar_chat/services/api_services/channel_service.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

import '../../Settings/SColors.dart';

void showCommentBottomSheet(
    BuildContext context, int commentCount, String commentId, bool isChannel) {
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
      // FliqServices().getComments(id: commentId);
      return CommentScreen(
        commentController: commentController,
        userController: userController,
        commentCount: commentCount,
        commentId: commentId,
        isChannel: isChannel,
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
    required this.isChannel,
  }) : super(key: key);

  final TextEditingController commentController;
  final UserController userController;
  final int commentCount;
  final String commentId;
  final bool isChannel;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return FutureBuilder(
        future: widget.isChannel
            ? ChannelService().getComments(id: widget.commentId)
            : FliqServices().getComments(id: widget.commentId),
        builder: (context, AsyncSnapshot<CommentResponseModel?> snapshot) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              '${snapshot.hasData && snapshot.data != null ? snapshot.data!.arrList.length : widget.commentCount} Comments',
                            style: TextStyle(
                              color: themeController.isDarkTheme.value
                                  ?  SColors.color4
                                  : SColors.color3,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: themeController.isDarkTheme.value
                              ?  SColors.color4
                              : SColors.color3
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  !snapshot.hasData || snapshot.data == null
                      ? const Spacer()
                      : Expanded(
                          child: ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.arrList.length,
                          itemBuilder: (context, index) {
                            CommentItem commentItem =
                                snapshot.data!.arrList.elementAt(index);
                            return MainTile(
                                likeCount: commentItem.likeCount.toString(),
                                id: commentItem.id,
                                comment: commentItem.strComment,
                                commenterName: commentItem.strCreatedUser,
                                isLiked: commentItem.isLiked,
                                flickId: commentItem.strFlickId,
                                onLiked: (val) {
                                  if (widget.isChannel) {
                                    if (val) {
                                      ChannelService().unLikeChannelComment(
                                        channelId: commentItem.strChannelId,
                                        commentId: commentItem.id,
                                      );
                                    } else {
                                      ChannelService().likeChannelComment(
                                        channelId: commentItem.strChannelId,
                                        commentId: commentItem.id,
                                      );
                                    }
                                    return;
                                  }

                                  if (val) {
                                    FliqServices().unLikeFlickComment(
                                        flickId: commentItem.strFlickId,
                                        commentId: commentItem.id);
                                  } else {
                                    FliqServices().likeFlickComment(
                                        flickId: commentItem.strFlickId,
                                        commentId: commentItem.id);
                                  }
                                },
                                time: commentItem.strCreatedTime,
                                commenterProfileUrl:
                                    commentItem.strCreatedUserProfile);
                          },
                        )),
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
                          hintStyle: TextStyle(
                              color:
                                  Get.find<ThemeController>().isDarkTheme.value
                                      ? const Color.fromARGB(170, 0, 0, 0)
                                      : null),
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
                                  if (widget.isChannel) {
                                    await ChannelService().addComments(
                                      channelId: widget.commentId,
                                      comment: widget.commentController.text,
                                    );
                                    widget.commentController.clear();
                                    FocusScope.of(context).unfocus();
                                    setState(() {});
                                    return;
                                  }
                                  await FliqServices().addComments(
                                    flickId: widget.commentId,
                                    comment: widget.commentController.text,
                                  );
                                  widget.commentController.clear();
                                  FocusScope.of(context).unfocus();
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
            ),
          );
        });
  }
}

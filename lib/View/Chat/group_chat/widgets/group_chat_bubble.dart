import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stellar_chat/View/chat/chat_screen/chat_screen.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/chat_bubble.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/document_bubble.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/group_location_bubble.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/show_time_widget.dart';
import 'package:stellar_chat/View/chat/group_chat/widgets/audio_message_widget.dart';
import 'package:stellar_chat/View/chat/group_chat/widgets/voice_chat_bubble.dart';
import 'package:stellar_chat/View/chat/widgets/photo_view_widget.dart';
import 'package:stellar_chat/controllers/audio_player_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/group_chat/group_message_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BubbleAlignment { left, right }

class GroupChatBubble extends StatelessWidget {
  final GroupMessageModel message;
  final String senderName;
  // final String message;
  final BubbleAlignment alignment;

  const GroupChatBubble({
    required this.senderName,
    // required this.message,
    required this.alignment,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    bool isSent = (alignment != BubbleAlignment.left);
    final AudioController audioController = Get.put(AudioController());
    return Padding(
      padding: message.strMessageType == "tag"
          ? const EdgeInsets.all(4.0)
          : const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment == BubbleAlignment.left
            ? CrossAxisAlignment.start
            : message.strMessageType == "tag"
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.end,
        children: [
          // alignment == BubbleAlignment.right || message.strMessageType == "tag"
          //     ? const SizedBox()
          //     : Text(
          //         senderName,
          //         style: const TextStyle(
          //           fontSize: 12.0,
          //           color: Colors.grey,
          //         ),
          //       ),
          message.strMessageType == "sticker"
              ? SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      alignment == BubbleAlignment.left
                          ? Row(
                              children: [
                                Text(
                                  "  ${message.strName}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          : const SizedBox(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage(
                                message.strMessage), // Add your image URL here
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 2.0, right: 5, left: 5),
                        child: Text(
                          message.strCreatedTime,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: message.strMessageType == "voice" ||
                              message.strMessageType == "contact" ||
                              message.strMessageType == "document" ||
                              message.strMessageType == "location" ||
                              message.strMessageType.contains("senting") ||
                              message.strMessageType == "tag"
                          ? 0
                          : 4),
                  padding: EdgeInsets.all(message.strMessageType == "voice" ||
                          message.strMessageType == "document" ||
                          message.strMessageType.contains("senting") ||
                          message.strMessageType == "contact" ||
                          message.strMessageType == "location" ||
                          message.strMessageType == "tag"
                      ? 0
                      : 8.0),
                  decoration: message.strMessageType == "voice" ||
                          message.strMessageType == "document" ||
                          message.strMessageType == "location" ||
                          message.strMessageType == "contact"
                      ? null
                      : BoxDecoration(
                          color: message.strMessageType == "tag"
                              ? Colors.transparent
                              : alignment == BubbleAlignment.left
                                  ? const Color.fromRGBO(246, 245, 245, 1)
                                  : const Color(0xFFE9F4FF),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            topRight: const Radius.circular(12.0),
                            bottomLeft: alignment == BubbleAlignment.right
                                ? const Radius.circular(12.0)
                                : const Radius.circular(0.0),
                            bottomRight: alignment == BubbleAlignment.left
                                ? const Radius.circular(12.0)
                                : const Radius.circular(0.0),
                          ),
                          boxShadow: alignment == BubbleAlignment.left &&
                                  message.strMessageType != "tag"
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 2.0,
                                    offset: const Offset(1.0, 1.0),
                                  ),
                                ]
                              : [],
                        ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      alignment == BubbleAlignment.right ||
                              message.strMessageType == "tag" ||
                              message.strMessageType == "document" ||
                              message.strMessageType == "location"
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                senderName,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 6,
                      ),
                      message.strMessageType == "location" ||
                              message.strMessageType == "sentingLoc"
                          ? GroupLocationBubble(
                              isSent: isSent, message: message)
                          : message.strMessageType == "contact"
                              ? Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: Get.width * 0.6,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(10),
                                        ),
                                        color: isSent
                                            ? const Color.fromRGBO(
                                                233, 244, 255, 1)
                                            : const Color.fromRGBO(
                                                244, 244, 244, 1),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(message.strContactName)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: isSent
                                                ? MainAxisAlignment.end
                                                : MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2.0,
                                                    right: 5,
                                                    left: 5),
                                                child: Text(
                                                  message.strCreatedTime,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              isSent
                                                  ? SvgPicture.string(
                                                      """<svg width="10" height="5" viewBox="0 0 10 5" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 2.38197C0.0398437 2.30405 0.0679687 2.21808 0.121875 2.15236C0.317708 1.91496 0.652083 1.91185 0.877083 2.14275C1.37378 2.65358 1.86901 3.16492 2.36276 3.67678L2.48802 3.80665C2.7263 3.55912 2.95521 3.31133 3.19479 3.07392C4.17257 2.10613 5.15122 1.1399 6.13073 0.175222C6.2888 0.0193778 6.46927 -0.0416612 6.68203 0.0295076C7.03568 0.148209 7.12891 0.589508 6.85703 0.863014C6.53854 1.18353 6.21406 1.49834 5.89349 1.81548C4.8796 2.81548 3.86615 3.81574 2.85312 4.81626C2.69687 4.97211 2.51667 5.04016 2.30443 4.96873C2.22209 4.93891 2.1477 4.89066 2.08698 4.82769C1.43924 4.16483 0.794792 3.49929 0.153646 2.83107C0.0869792 2.7612 0.0494792 2.66275 0 2.57756V2.38197Z" fill="#00338E"/>
<path d="M10.0001 0.608279C9.96049 0.754513 9.867 0.862565 9.76101 0.96672C8.46205 2.24516 7.16379 3.52447 5.86622 4.80464C5.59903 5.06984 5.31596 5.06438 5.05215 4.7888C4.91726 4.64802 4.78106 4.5088 4.64695 4.36724C4.43393 4.1423 4.42976 3.83503 4.63549 3.63685C4.84122 3.43867 5.14721 3.4501 5.36622 3.67166L5.50684 3.81477C5.88314 3.42516 6.24903 3.03243 6.62846 2.65399C7.45241 1.83295 8.28861 1.02412 9.1084 0.198928C9.4209 -0.115617 9.9032 0.0308762 9.98575 0.40672C9.98911 0.415977 9.99376 0.42472 9.99955 0.432694L10.0001 0.608279Z" fill="#00338E"/>
</svg>
""")
                                                  : const SizedBox(),
                                              const SizedBox(
                                                width: 8,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (message.strChatId.isEmpty) {
                                          //show invite
                                          Share.share(
                                              'check out stellar chat https://stellarchat.com',
                                              subject:
                                                  'Come connect me on Stellar chat');
                                        } else {
                                          Get.to(
                                            () => PrivateChatScreen(
                                                chatId: message.strChatId,
                                                fullName: message.strName,
                                                imageUrl: message.strUrl),
                                          );
                                        }
                                      },
                                      child: Container(
                                        height: 30,
                                        width: Get.width * 0.6,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: isSent
                                                  ? const Radius.circular(10)
                                                  : const Radius.circular(0),
                                              bottomRight: !isSent
                                                  ? const Radius.circular(10)
                                                  : const Radius.circular(0),
                                            ),
                                            color: isSent
                                                ? const Color.fromRGBO(
                                                    197, 229, 255, 1)
                                                : const Color.fromRGBO(
                                                    224, 224, 224, 1)),
                                        child: Center(
                                          child: Text(message.strChatId.isEmpty
                                              ? "Invite"
                                              : "Message"),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : message.strMessageType == "text"
                                  ? SizedBox(
                                      width: Get.width * 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                message.strMessage,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  message.strCreatedTime,
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          87, 87, 87, 1),
                                                      fontSize: 6,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : message.strMessageType == "image"
                                      ? Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  () => PhotoViewScreen(
                                                      imageUrl: message.strUrl),
                                                );
                                              },
                                              child: SizedBox(
                                                  height: Get.width * 0.4,
                                                  width: Get.width * 0.6,
                                                  child: Padding(
                                                    padding: message
                                                                .strMessageType ==
                                                            "text"
                                                        ? const EdgeInsets.all(
                                                            8)
                                                        : message.strMessageType ==
                                                                "image"
                                                            ? const EdgeInsets
                                                                .all(2.0)
                                                            : const EdgeInsets
                                                                .all(0),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: message.strUrl,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Center(
                                                        child: CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    message.strCreatedTime,
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 6),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      : message.strMessageType == "voice"
                                          ? AudioMessageBubble(
                                              audioController: audioController,
                                              audioUrl: message.strUrl,
                                              isSender: message.strUserId ==
                                                  controller.userDetailsModel
                                                      .value!.id,
                                              createdTime:
                                                  message.strCreatedTime,
                                            )
                                          : message.strMessageType ==
                                                      "document" ||
                                                  message.strMessageType ==
                                                      "sentingDoc"
                                              ? DocumentBubble(
                                                  senterName: message.strName,
                                                  isGroup: true,
                                                  createdTime:
                                                      message.strCreatedTime,
                                                  isSenting:
                                                      message.strMessageType ==
                                                          "sentingDoc",
                                                  isSent: isSent,
                                                  message: message.strMessage,
                                                  url: message.strUrl,
                                                )
                                              : message.strMessageType == "tag"
                                                  ? Center(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                .fromRGBO(233,
                                                                244, 255, 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: Get.width * 0.7,
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        12.0),
                                                            child: Text(
                                                              message
                                                                  .strMessage,
                                                              style: const TextStyle(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          142,
                                                                          1)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                    ],
                  )),
        ],
      ),
    );
  }
}

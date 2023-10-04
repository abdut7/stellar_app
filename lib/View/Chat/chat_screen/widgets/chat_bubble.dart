import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:stellar_chat/View/chat/group_chat/widgets/voice_chat_bubble.dart';
import 'package:stellar_chat/View/chat/widgets/photo_view_widget.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../models/private_chat/private_chat_model.dart';

class ChatBubble extends StatelessWidget {
  final PrivateMessageModel message;

  ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    // print(message.strUserId);
    // print(controller.userDetailsModel.value!.id);
    // print(message.strUserId == controller.userDetailsModel.value!.id);

    final isSent =
        (message.strUserId == controller.userDetailsModel.value!.id) ||
            message.strMessageType == "sentingImage";
    final alignment =
        isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isSent
        ? const Color.fromRGBO(233, 244, 255, 1)
        : const Color.fromRGBO(246, 245, 245, 1);

    final downColor = isSent
        ? const Color.fromRGBO(197, 229, 255, 1)
        : const Color.fromRGBO(224, 224, 224, 1);

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          // width: Get.width * 0.5,

          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: message.strMessageType == "tag"
                ? CrossAxisAlignment.center
                : alignment,
            children: <Widget>[
              message.strMessageType == "tag"
                  ? Center(
                      child: Text(message.strMessage),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: message.strMessageType == "voice" ? null : color,
                        boxShadow: null,
                        // : [
                        //     BoxShadow(
                        //       color:
                        //           Colors.grey.withOpacity(0.5), // BoxShadow color
                        //       spreadRadius: 5, // Spread radius
                        //       blurRadius: 7, // Blur radius
                        //       offset: Offset(0, 3), // Offset from top left
                        //     ),
                        //   ],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          bottomLeft: isSent
                              ? const Radius.circular(10)
                              : const Radius.circular(0),
                          bottomRight: isSent
                              ? const Radius.circular(0)
                              : const Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: message.strMessageType == "text"
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, top: 8, right: 24),
                                  child: Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      message.strMessage,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(87, 87, 87, 1)),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: Get.width * 0.6,
                                  decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment: isSent
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0, right: 5, left: 5),
                                        child: Text(
                                          message.strCreatedTime,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 10),
                                        ),
                                      ),
                                      isSent
                                          ? SvgPicture.string(
                                              """<svg width="10" height="5" viewBox="0 0 10 5" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 2.38197C0.0398437 2.30405 0.0679687 2.21808 0.121875 2.15236C0.317708 1.91496 0.652083 1.91185 0.877083 2.14275C1.37378 2.65358 1.86901 3.16492 2.36276 3.67678L2.48802 3.80665C2.7263 3.55912 2.95521 3.31133 3.19479 3.07392C4.17257 2.10613 5.15122 1.1399 6.13073 0.175222C6.2888 0.0193778 6.46927 -0.0416612 6.68203 0.0295076C7.03568 0.148209 7.12891 0.589508 6.85703 0.863014C6.53854 1.18353 6.21406 1.49834 5.89349 1.81548C4.8796 2.81548 3.86615 3.81574 2.85312 4.81626C2.69687 4.97211 2.51667 5.04016 2.30443 4.96873C2.22209 4.93891 2.1477 4.89066 2.08698 4.82769C1.43924 4.16483 0.794792 3.49929 0.153646 2.83107C0.0869792 2.7612 0.0494792 2.66275 0 2.57756V2.38197Z" fill="#00338E"/>
<path d="M10.0001 0.608279C9.96049 0.754513 9.867 0.862565 9.76101 0.96672C8.46205 2.24516 7.16379 3.52447 5.86622 4.80464C5.59903 5.06984 5.31596 5.06438 5.05215 4.7888C4.91726 4.64802 4.78106 4.5088 4.64695 4.36724C4.43393 4.1423 4.42976 3.83503 4.63549 3.63685C4.84122 3.43867 5.14721 3.4501 5.36622 3.67166L5.50684 3.81477C5.88314 3.42516 6.24903 3.03243 6.62846 2.65399C7.45241 1.83295 8.28861 1.02412 9.1084 0.198928C9.4209 -0.115617 9.9032 0.0308762 9.98575 0.40672C9.98911 0.415977 9.99376 0.42472 9.99955 0.432694L10.0001 0.608279Z" fill="#00338E"/>
</svg>
""")
                                          : SizedBox(),
                                      const SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : message.strMessageType == "image"
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => PhotoViewScreen(
                                          imageUrl: message.strUrl),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: Get.width * 0.4,
                                        width: Get.width * 0.6,
                                        child: Padding(
                                          padding:
                                              message.strMessageType == "text"
                                                  ? const EdgeInsets.all(8)
                                                  : message.strMessageType ==
                                                          "image"
                                                      ? const EdgeInsets.all(0)
                                                      : const EdgeInsets.all(0),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: message.strUrl,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 15,
                                        width: Get.width * 0.6,
                                        decoration: BoxDecoration(
                                          color: downColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: isSent
                                                ? Radius.circular(10)
                                                : Radius.circular(0),
                                            bottomRight: !isSent
                                                ? Radius.circular(10)
                                                : Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
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
                                                : SizedBox(),
                                            const SizedBox(
                                              width: 8,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : message.strMessageType == "voice"
                                  ? AudioMessageBubble(
                                      createdTime: message.strCreatedTime,
                                      audioUrl: message.strUrl,
                                      isSender: isSent,
                                    )
                                  : message.strMessageType == "sentingImage"
                                      ? Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            height: Get.width * 0.4,
                                            width: Get.width * 0.6,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(message.strUrl),
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                    ),
              // const SizedBox(height: 4.0),
            ],
          ),
        ),
        // (message.strMessageType != "sentingImage" &&
        //         message.strMessageType != "voice")
        //     ? Container(
        //         width: Get.width * 0.5,
        //         decoration: BoxDecoration(
        //             color: isSent
        //                 ? const Color.fromRGBO(197, 229, 255, 1)
        //                 : const Color.fromRGBO(224, 224, 224, 1),
        //             borderRadius: const BorderRadius.vertical(
        //                 bottom: Radius.circular(10))),
        //         // width: message.strUrl.isEmpty
        //         //     ? Get.width * 0.5 + 2
        //         //     : Get.width * 0.6,
        //         child: Row(
        //           mainAxisAlignment:
        //               isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.only(bottom: 2.0),
        //               child: Text(
        //                 message.strCreatedTime,
        //                 style: const TextStyle(color: Colors.grey),
        //               ),
        //             ),
        //             const SizedBox(width: 4.0),
        //             Icon(
        //               isSent ? Icons.done_all : Icons.done,
        //               color: Colors.grey,
        //               size: 16.0,
        //             ),
        //           ],
        //         ),
        //       )
        //     : const SizedBox(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

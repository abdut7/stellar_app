import 'dart:io';

import 'package:stellar_chat/View/chat/group_chat/widgets/voice_chat_bubble.dart';
import 'package:stellar_chat/View/chat/widgets/photo_view_widget.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/utils/uid.dart';
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

    final isSent =
        message.strName == 'You' || message.strMessageType == "sentingImage";
    final alignment =
        isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isSent ? const Color.fromRGBO(233, 244, 255, 1) : Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // width: Get.width * 0.5,
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: alignment,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: message.strMessageType == "voice" ? null : color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft:
                          isSent ? Radius.circular(10) : Radius.circular(0),
                      bottomRight:
                          isSent ? Radius.circular(0) : Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(2),
                child: message.strMessageType == "text"
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
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
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(197, 229, 255, 1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 2.0, right: 5),
                                  child: Text(
                                    message.strCreatedTime,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : message.strMessageType == "image"
                        ? GestureDetector(
                            onTap: () {
                              Get.to(() =>
                                  PhotoViewScreen(imageUrl: message.strUrl));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: Get.width * 0.4,
                                    width: Get.width * 0.6,
                                    child: Padding(
                                      padding: message.strMessageType == "text"
                                          ? const EdgeInsets.all(8)
                                          : message.strMessageType == "image"
                                              ? const EdgeInsets.all(0)
                                              : const EdgeInsets.all(0),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: message.strUrl,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    )),
                                Container(
                                  height: 15,
                                  width: Get.width * 0.6,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(197, 229, 255, 1),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0, right: 5),
                                        child: Text(
                                          message.strCreatedTime,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 10),
                                        ),
                                      ),
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
                                                  File(message.strUrl)))),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
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

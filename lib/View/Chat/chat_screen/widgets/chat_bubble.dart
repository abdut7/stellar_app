import 'dart:io';

import 'package:stellar_chat/View/chat/group_chat/widgets/voice_chat_bubble.dart';
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

    final isSent = message.strUserId == globalUid ||
        message.strMessageType == "sentingImage";
    final alignment =
        isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isSent ? const Color(0xFF243E87) : Colors.grey;

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: message.strMessageType == "voice" ? null : color,
              borderRadius: BorderRadius.only(
                  bottomRight: !isSent
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  bottomLeft: isSent
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(2),
            child: message.strMessageType == "text"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message.strMessage,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                : message.strMessageType == "image"
                    ? SizedBox(
                        height: Get.width * 0.4,
                        width: Get.width * 0.6,
                        child: Padding(
                          padding: message.strMessageType == "text"
                              ? const EdgeInsets.all(8)
                              : message.strMessageType == "image"
                                  ? const EdgeInsets.all(2.0)
                                  : const EdgeInsets.all(0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: message.strUrl,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ))
                    : message.strMessageType == "voice"
                        ? AudioMessageBubble(
                            audioUrl: message.strUrl,
                            isSender: message.strUserId ==
                                controller.userDetailsModel.value!.id,
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
                                          image:
                                              FileImage(File(message.strUrl)))),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              )
                            : const SizedBox(),
          ),
          const SizedBox(height: 4.0),
          message.strMessageType != "sentingImage"
              ? Row(
                  mainAxisAlignment:
                      isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      message.strCreatedTime,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 4.0),
                    Icon(
                      isSent ? Icons.done_all : Icons.done,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

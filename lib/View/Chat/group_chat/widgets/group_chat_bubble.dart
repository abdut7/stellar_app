import 'package:stellar_chat/View/chat/group_chat/widgets/voice_chat_bubble.dart';
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

  GroupChatBubble({
    required this.senderName,
    // required this.message,
    required this.alignment,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment == BubbleAlignment.left
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          alignment == BubbleAlignment.right
              ? const SizedBox()
              : Text(
                  senderName,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: message.strMessageType == "voice" ? 0 : 4),
            padding:
                EdgeInsets.all(message.strMessageType == "voice" ? 0 : 8.0),
            decoration: message.strMessageType == "voice"
                ? null
                : BoxDecoration(
                    color: alignment == BubbleAlignment.left
                        ? Colors.white
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
                    boxShadow: alignment == BubbleAlignment.left
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 2.0,
                              offset: const Offset(1.0, 1.0),
                            ),
                          ]
                        : [],
                  ),
            child: message.strMessageType == "text"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message.strMessage,
                      style: const TextStyle(color: Colors.black),
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
                        : const SizedBox(),
          ),
          Text(
            message.strCreatedTime,
            style: const TextStyle(color: Colors.grey, fontSize: 8),
          )
        ],
      ),
    );
  }
}

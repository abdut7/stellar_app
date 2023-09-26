import 'dart:io';

import 'package:base_project/utils/uid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path/path.dart';
import '../../../../models/private_chat/private_chat_model.dart';
import 'package:voice_message_package/voice_message_package.dart';

class ChatBubble extends StatelessWidget {
  final PrivateMessageModel message;

  ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.strUserId == globalUid;
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
              color: color,
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
            padding: const EdgeInsets.all(8.0),
            child: message.strMessageType == "text"
                ? Text(
                    message.strMessage,
                    style: const TextStyle(color: Colors.white),
                  )
                : message.strMessageType == "image"
                    ? SizedBox(
                        height: Get.width * 0.4,
                        width: Get.width * 0.6,
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
                        ))
                    : message.strMessageType == "voice"
                        ? VoiceMailWidget(message: message)
                        // SizedBox()
                        : const SizedBox(),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment:
                isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Text(
                message.strCreatedTime,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 4.0),
              if (isSent)
                const Icon(
                  true ? Icons.done_all : Icons.done,
                  color: Colors.grey,
                  size: 16.0,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class VoiceMailWidget extends StatelessWidget {
  const VoiceMailWidget({
    super.key,
    required this.message,
  });

  final PrivateMessageModel message;

  @override
  Widget build(BuildContext context) {
    return VoiceMessage(
      // showDuration: true,
      audioFile: getFile(message.strUrl),
      // played: false, // To show played badge or not.
      me: true, // Set message side.
      onPlay: () {}, // Do something when voice played.
    );
    return FutureBuilder(
      future: getFile(message.strUrl),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return VoiceMessage(
            // showDuration: true,
            audioSrc: message.strUrl,
            // played: false, // To show played badge or not.
            me: true, // Set message side.
            onPlay: () {}, // Do something when voice played.
          );
        }
        return VoiceMessage(
          // showDuration: true,
          audioFile: getFile(message.strUrl),
          // played: false, // To show played badge or not.
          me: true, // Set message side.
          onPlay: () {}, // Do something when voice played.
        );
      },
    );
  }
}

Future<File> getFile(String url) async {
  File file = await DefaultCacheManager().getSingleFile(url);
  return file;
}

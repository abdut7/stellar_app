import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stellar_chat/view/chat/chat_screen/chat_screen.dart';
import 'package:stellar_chat/view/chat/chat_screen/widgets/show_time_widget.dart';
import 'package:stellar_chat/models/private_chat/private_chat_model.dart';

class ContactMessageBubble extends StatelessWidget {
  const ContactMessageBubble({
    super.key,
    required this.isSent,
    required this.message,
  });

  final bool isSent;
  final PrivateMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            color: isSent
                ? const Color.fromRGBO(233, 244, 255, 1)
                : const Color.fromRGBO(244, 244, 244, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Text(message.strContactName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                      ))
                ],
              ),
              ShowTimeWidgetChatBuble(
                isSent: isSent,
                message: message,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            if (message.strContactId == null) {
              //show invite
              Share.share('check out stellar chat https://stellarchat.com',
                  subject: 'Come connect me on Stellar chat');
            } else {
              Get.to(
                () => PrivateChatScreen(
                  chatId: message.strContactId!,
                  fullName: message.strName,
                  imageUrl: message.strUrl,
                ),
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
                    ? const Color.fromRGBO(197, 229, 255, 1)
                    : const Color.fromRGBO(224, 224, 224, 1)),
            child: Center(
              child: Text(message.strContactId == null ? "Invite" : "Message",
                  style: const TextStyle(
                    fontFamily: 'Inter',
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

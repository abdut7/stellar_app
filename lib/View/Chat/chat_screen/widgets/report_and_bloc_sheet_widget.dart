import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/chat/search/search.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/services/api_services/chat_message_service.dart';

showBlockAndReportBottomSheet(
    {required BuildContext context,
    required String id,
    required Function() onViewProfile}) {
  return showModalBottomSheet(
    backgroundColor: SColors.color11,
    shape: const RoundedRectangleBorder(
      // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  onViewProfile();
                },
                child: Center(
                  child: Text(
                    'View Profile',
                    style: TextStyle(
                      color: SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.to(() => SearchScreen(
                        chatId: id,
                        isGroup: false,
                      ));
                },
                child: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showMuteNotificationSheet(context: context);
                },
                child: Center(
                  child: Text(
                    'Mute Notification',
                    style: TextStyle(
                      color: SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showSubBottomSheet(
                    context: context,
                    text1: 'Do You want to',
                    text2: ChatMessageService.isBlocked
                        ? "Unblock user"
                        : ' Block the user',
                    cancelText: 'Cancel',
                    okText: 'OK',
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    onOk: () async {
                      Get.back();
                      if (!ChatMessageService.isBlocked) {
                        await AccountServices.blockUser(id);
                      } else {
                        await AccountServices.unBlockUser(id);
                      }
                    },
                  );
                },
                child: Center(
                  child: Text(
                    ChatMessageService.isBlocked
                        ? "Unblock User"
                        : 'Block User',
                    style: TextStyle(
                      color: SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showSubBottomSheet(
                    context: context,
                    text1: 'Do You want to Clear all',
                    text2: ' Messages by you',
                    cancelText: 'Cancel',
                    okText: 'OK',
                    onCancel: () {
                      Get.back();
                    },
                    onOk: () {
                      Get.back();
                      ChatMessageService.clearAllMessages(chatId: id);
                      showCustomSnackbar(
                          title: "Chat Clear in progress",
                          message: "Clearing all messages");
                    },
                  );
                },
                child: Center(
                  child: Text(
                    'Clear All Chat',
                    style: TextStyle(
                      color: SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showSubBottomSheet(
                    context: context,
                    text1: 'Do You want to',
                    text2: ' Report the user',
                    cancelText: 'Cancel',
                    okText: 'OK',
                    onCancel: () {
                      Get.back();
                    },
                    onOk: () async {
                      Get.back();
                      // report user here
                      showCustomSnackbar(
                          title: "User has been reported", message: "");
                    },
                  );
                },
                child: Center(
                  child: Text('Report User',
                      style: TextStyle(
                        color: SColors.color12,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      );
    },
  );
}

void showMuteNotificationSheet(
    {required BuildContext context, bool isGroup = false}) {
  showModalBottomSheet(
    backgroundColor: SColors.color4,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return const SelectNotificationTimeWidget();
    },
  );
}

class SelectNotificationTimeWidget extends StatefulWidget {
  const SelectNotificationTimeWidget({
    super.key,
  });

  @override
  State<SelectNotificationTimeWidget> createState() =>
      _SelectNotificationTimeWidgetState();
}

MuteNotificationTime selectedVal = MuteNotificationTime.eightHr;

class _SelectNotificationTimeWidgetState
    extends State<SelectNotificationTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          const Text(
            'Mute Notification',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Other participants will not see',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            'that you muted this chat',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          selectionRow('8 hours', MuteNotificationTime.eightHr, selectedVal,
              onChanged: (val) {
            setState(() {
              selectedVal = val;
            });
          }),
          selectionRow('One Weeks', MuteNotificationTime.oneWeek, selectedVal,
              onChanged: (val) {
            setState(() {
              selectedVal = val;
            });
          }),
          selectionRow('Always', MuteNotificationTime.always, selectedVal,
              onChanged: (val) {
            setState(() {
              selectedVal = val;
            });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 30,
                  decoration: BoxDecoration(
                    color: SColors.color4,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: SColors.color12,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showCustomSnackbar(
                      title: "Muted notification", message: "message");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 51, 142, 1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Center(
                    child: Text(
                      'OK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showSubBottomSheet(
    {required BuildContext context,
    required String text1,
    required String text2,
    required String cancelText,
    required String okText,
    required VoidCallback onCancel,
    required VoidCallback onOk}) {
  showModalBottomSheet(
    backgroundColor: SColors.color11,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              text2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 30,
                    decoration: BoxDecoration(
                      color: SColors.color11,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        cancelText,
                        style: TextStyle(
                          color: SColors.color12,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onOk,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 51, 142, 1),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        okText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

enum MuteNotificationTime { eightHr, oneWeek, always }

Widget selectionRow(
    String text, MuteNotificationTime value, MuteNotificationTime selectedValue,
    {required Function(MuteNotificationTime) onChanged}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
    child: Row(
      children: <Widget>[
        Radio(
            value: value,
            groupValue: selectedValue,
            onChanged: (val) {
              onChanged(val!);
            }),
        Text(
          text,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    ),
  );
}

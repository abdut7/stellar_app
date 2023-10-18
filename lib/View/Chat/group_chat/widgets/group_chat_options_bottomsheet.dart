import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/report_and_bloc_sheet_widget.dart';
import 'package:stellar_chat/View/chat/group_chat/group_info/group_info_screen.dart';
import 'package:stellar_chat/View/chat/search/search.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';

groupChatMainBottomSheet(BuildContext context, String chatId) {
  ThemeController themeController = Get.find();
  return showModalBottomSheet(
    backgroundColor: themeController.isDarkTheme.value
        ?  SColors.darkmode
        : SColors.color11,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  child: Divider(
                    thickness: 3,
                    color:themeController.isDarkTheme.value
                        ?  SColors.color26
                        : Color.fromRGBO(0, 51, 142, 0.5),

                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.to(() => GroupInfoScreen(
                          chatId: chatId,
                        ));
                  },
                  child: Text(
                    'Group Info',
                    style: TextStyle(
                      color: themeController.isDarkTheme.value
                          ?  SColors.sheetItemColor
                          : SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
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
                          chatId: chatId,
                          isGroup: true,
                        ));
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: themeController.isDarkTheme.value
                          ?  SColors.sheetItemColor
                          : SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    // showMuteNotificationBottomSheet(context);
                    Get.back();
                    showMuteNotificationSheet(context: context, isGroup: true);
                  },
                  child: Text(
                    'Mute Notification',
                    style: TextStyle(
                        color: themeController.isDarkTheme.value
                            ?  SColors.sheetItemColor
                            : SColors.color12,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // const SizedBox(
                //   height: 18,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     showSubBottomSheet(
                //       context: context,
                //       text1: 'Do You want to',
                //       text2: ' Report the user',
                //       cancelText: 'Cancel',
                //       okText: 'OK',
                //       onCancel: () {},
                //       onOk: () {},
                //     );
                //   },
                //   child: Text(
                //     'Report User',
                //     style: TextStyle(
                //       color: SColors.color12,
                //       fontSize: 11,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 18,
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     'Exit Group',
                //     style: TextStyle(
                //       color: SColors.color12,
                //       fontSize: 11,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    showSubBottomSheet(
                      context: context,
                      text1: 'Do You want to Clear all',
                      text2: ' Call Logs',
                      cancelText: 'Cancel',
                      okText: 'OK',
                      onCancel: () {
                        Get.back();
                      },
                      onOk: () {
                        Get.back();
                        showCustomSnackbar(
                            title: "Clearing the chats", message: "");
                      },
                    );
                  },
                  child: Text(
                    'Clear All Chat',
                    style: TextStyle(
                      color: themeController.isDarkTheme.value
                          ?  SColors.sheetItemColor
                          : SColors.color12,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 18,
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     'Export Chat',
                //     style: TextStyle(
                //       color: SColors.color12,
                //       fontSize: 11,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

// void showMuteNotificationBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     backgroundColor: SColors.color4,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(15.0),
//       ),
//     ),
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Text(
//               'Mute Notification',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               'Other participants will not see',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             const Text(
//               'that you muted this chat',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             const SizedBox(height: 30.0),
//             selectionRow('8 hours'),
//             const SizedBox(
//               height: 10,
//             ),
//             selectionRow('One Weeks'),
//             const SizedBox(
//               height: 10,
//             ),
//             selectionRow('Always'),
//             const SizedBox(
//               height: 35,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.25,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: SColors.color4,
//                       borderRadius: BorderRadius.circular(9),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: SColors.color12,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.25,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(0, 51, 142, 1),
//                       borderRadius: BorderRadius.circular(9),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'OK',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

void showSubBottomSheet(
    {required BuildContext context,
    required String text1,
    required String text2,
    required String cancelText,
    required String okText,
    required VoidCallback onCancel,
    required VoidCallback onOk}) {
  ThemeController themeController = Get.find();
  showModalBottomSheet(
    backgroundColor: themeController.isDarkTheme.value
        ?  SColors.darkmode
        : SColors.color11,
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
              style:  TextStyle(
                color:  themeController.isDarkTheme.value
                    ?  SColors.color4
                    : SColors.color3,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                color: themeController.isDarkTheme.value
                    ?  SColors.color4
                    : SColors.color3,
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
                      color: themeController.isDarkTheme.value
                          ?  SColors.darkmode
                          : SColors.color11,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        cancelText,
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ?  SColors.color26
                              : SColors.color12,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
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
                      color: themeController.isDarkTheme.value
                          ?  SColors.color3
                          : SColors.color12,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        okText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
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

Widget selectionRow(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 130),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 14,
          width: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SColors.color11,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    ),
  );
}

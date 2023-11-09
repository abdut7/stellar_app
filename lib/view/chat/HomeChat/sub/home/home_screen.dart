import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/home/widgets/chat_home_appbar_widget.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/home/widgets/chat_tile_widget.dart';
import 'package:stellar_chat/view/contact/show_contact/show_contacts_screen.dart';
import 'package:stellar_chat/view/chat/group_chat/group_chat_screen.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/models/api_models/chat_history_model.dart';
import 'package:stellar_chat/services/api_services/chat_history_service.dart';
import 'package:stellar_chat/utils/colors.dart';
import 'package:stellar_chat/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:get/get.dart';

import '../../../../../controllers/api_controllers/chat_history_controller.dart';
import '../../../chat_screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ChatHistoryServiceApi.getChatHistory();
    super.initState();
  }

  Future<void> refreshChatHistory() async {
    // Refresh chat history data when the user pulls down
    await ChatHistoryServiceApi.getChatHistory(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    ChatHistoryController chatHistoryController = Get.put(
      ChatHistoryController(),
    );
    return RefreshIndicator(
      onRefresh: refreshChatHistory,
      child: Scaffold(
        backgroundColor: themeController.isDarkTheme.value
            ? const Color.fromRGBO(25, 25, 25, 1)
            : SColors.color4,
        appBar: AppBar(
          backgroundColor: themeController.isDarkTheme.value
              ? const Color.fromRGBO(50, 50, 50, 1)
              : SColors.color12,
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              const ChatHomeAppbarWidget(),
              // const SizedBox(height: 8),
              const SearchTextField(),
              // const SizedBox(height: 8),
              Obx(() {
                if (chatHistoryController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (chatHistoryController.errorOccured.value) {
                  return const Center(
                    child: Text("Error occured while loading chat"),
                  );
                } else if (chatHistoryController.chatHistoryList.isEmpty) {
                  return const Center(
                    child: Text("No Chat Exist"),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      ChatHistoryList data =
                          chatHistoryController.chatHistoryList[index];
                      return GestureDetector(
                        onTap: () {},
                        child: ChatListItem(
                          chatId: data.id,
                          avatarUrl: data.strIconURL,
                          message: data.strMessage,
                          name: data.strName.isEmpty ? "Unknown" : data.strName,
                          time: data.strCreatedTime,
                          unreadCount: 0,
                          ontap: () {
                            if (data.strType == "private") {
                              Get.to(() => PrivateChatScreen(
                                  imageUrl: data.strIconURL,
                                  fullName: data.strName,
                                  chatId: data.strChatId));
                            } else if (data.strType == "group") {
                              Get.to(() => GroupChatScreen(
                                    chatHistoryList: data,
                                  ));
                            }
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: chatHistoryController.chatHistoryList.length,
                  ),
                );
              })
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(() => const ShowContactsScreen());
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeController.isDarkTheme.value
                  ? const Color.fromRGBO(0, 51, 142, 1)
                  : SColors.color13,
              image: const DecorationImage(
                image: AssetImage('assets/Images/all_contacts_icon.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

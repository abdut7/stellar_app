import 'package:base_project/View/Chat/HomeChat/sub/home/widgets/chat_home_appbar_widget.dart';
import 'package:base_project/View/Chat/HomeChat/sub/home/widgets/chat_tile_widget.dart';
import 'package:base_project/View/Contact/show_contact/show_contacts_screen.dart';
import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:base_project/services/api_services/chat_history_service.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:base_project/Settings/SColors.dart';
import 'package:get/get.dart';

import '../../../../../controllers/api_controllers/chat_history_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    ChatHistoryController chatHistoryController = Get.put(
      ChatHistoryController(),
    );
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        backgroundColor: SColors.color12,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Column(
        children: [
          const ChatHomeAppbarWidget(),
          const SizedBox(height: 25),
          const SearchTextField(),
          const SizedBox(height: 25),
          Obx(() {
            if (chatHistoryController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (chatHistoryController.errorOccured.value) {
              return const Center(
                child: Text("Erroro occured while loading chat"),
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
                  return ChatListItem(
                    avatarUrl: data.strIconURL,
                    message: "Message",
                    name: data.strName,
                    time: "02:33",
                    unreadCount: 3,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: chatHistoryController.chatHistoryList.length,
              ),
            );
          })
        ],
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: SColors.color13),
        child: IconButton(
          icon: const Icon(
            Icons.message,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Get.to(() => const ShowContactsScreen());
          },
        ),
      ),
    );
  }
}

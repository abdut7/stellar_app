import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/search_controllers.dart';

class SearchChatScreen extends StatefulWidget {
  @override
  State<SearchChatScreen> createState() => _SearchChatScreenState();
}

class _SearchChatScreenState extends State<SearchChatScreen> {
  @override
  Widget build(BuildContext context) {
    ChatSearchController searchController = Get.find();

    return Obx(() => searchController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : searchController.messageChatList.isEmpty
            ? const Center(child: Text("No messages"))
            : ListView.builder(
                itemCount: searchController.messageChatList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(searchController.messageChatList
                        .elementAt(index)
                        .strName),
                    title: Text(searchController.messageChatList
                        .elementAt(index)
                        .strMessage),
                    trailing: Text(searchController.messageChatList
                        .elementAt(index)
                        .strCreatedTime),
                  );
                },
              ));
  }
}

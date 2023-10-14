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

    return const Center(
      child: Text('Chat Content'),
    );
  }
}

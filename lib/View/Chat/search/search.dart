import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/Chat/search/widgets/search_audio/search_audio.dart';
import 'package:stellar_chat/View/Chat/search/widgets/search_chat/search_chat.dart';
import 'package:stellar_chat/View/Chat/search/widgets/search_document/search_document.dart';
import 'package:stellar_chat/View/Chat/search/widgets/search_media/search_media.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/search_controllers.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/services/api_services/chat_search_service.dart';

class SearchScreen extends StatefulWidget {
  final bool isGroup;
  final String chatId;
  const SearchScreen({Key? key, required this.isGroup, required this.chatId})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  PageController pageController = PageController(initialPage: 0);
  TextEditingController searchTextController = TextEditingController();
  int _currentPage = 0;
  late ChatSearchController searchController;

  @override
  void initState() {
    searchController = Get.put(ChatSearchController());
    // TODO: implement initState
    ChatSearchService.getTextMessages(
        search: "",
        chatId: widget.chatId,
        type: widget.isGroup ? "group" : "private");
    super.initState();
  }

  void _changePage(int page) {
    searchTextController.clear();
    if (page == 1) {
      ChatSearchService.getMediaMessages(
          search: "",
          chatId: widget.chatId,
          type: widget.isGroup ? "group" : "private");
    }
    if (page == 3) {
      ChatSearchService.getDocumentMessages(
          search: "",
          chatId: widget.chatId,
          type: widget.isGroup ? "group" : "private");
    }
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor:
          themeController.isDarkTheme.value ? SColors.darkmode : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: SColors.color11,
        title: TextFormField(
          controller: searchTextController,
          onChanged: (value) {
            if (_currentPage == 0) {
              ChatSearchService.getTextMessages(
                  search: value,
                  chatId: widget.chatId,
                  type: widget.isGroup ? "group" : "private");
            }
            if (_currentPage == 1) {
              ChatSearchService.getMediaMessages(
                  search: value,
                  chatId: widget.chatId,
                  type: widget.isGroup ? "group" : "private");
            }
            if (_currentPage == 2) {
              ChatSearchService.getAudioMessages(
                  search: value,
                  chatId: widget.chatId,
                  type: widget.isGroup ? "group" : "private");
            }
            if (_currentPage == 3) {
              ChatSearchService.getDocumentMessages(
                  search: value,
                  chatId: widget.chatId,
                  type: widget.isGroup ? "group" : "private");
            }
          },
          cursorColor: SColors.color12,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'Search',
            hintStyle: TextStyle(
              color: SColors.color9,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: SColors.color3, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: SColors.color4,
            size: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _changePage(0);
                    },
                    child: Container(
                      width: 80,
                      height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 0
                            ? SColors.color9.withOpacity(0.6)
                            : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Chat',
                          style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changePage(1);
                    },
                    child: Container(
                      width: 80,
                      height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 1
                            ? SColors.color9.withOpacity(0.6)
                            : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Media',
                          style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changePage(2);
                    },
                    child: Container(
                      width: 80,
                      height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 2
                            ? SColors.color9.withOpacity(0.6)
                            : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Audio',
                          style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _changePage(3);
                    },
                    child: Container(
                      width: 80,
                      height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 3
                            ? SColors.color9.withOpacity(0.6)
                            : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Document',
                          style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (int page) {
                if (page == 3) {
                  ChatSearchService.getDocumentMessages(
                      search: "",
                      chatId: widget.chatId,
                      type: widget.isGroup ? "group" : "private");
                }
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                SearchChatScreen(),
                const SearchMediaScreen(),
                SearchAudioScreen(),
                SearchDocumentScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

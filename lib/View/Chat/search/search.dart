import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/Chat/search/widgets/search_audio/search_audio.dart';
import 'package:base_project/View/Chat/search/widgets/search_chat/search_chat.dart';
import 'package:base_project/View/Chat/search/widgets/search_document/search_document.dart';
import 'package:base_project/View/Chat/search/widgets/search_media/search_media.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _changePage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: SColors.color11,
        title: TextFormField(
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
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: SColors.color4, size: 18,),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {_changePage(0);},
                    child: Container(
                      width: 112, height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 0 ? SColors.color9.withOpacity(0.6) : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),),),
                      child: Center(
                        child: Text(
                          'Chat', style: TextStyle(color: SColors.color3, overflow: TextOverflow.ellipsis, fontSize: 10, fontWeight: FontWeight.w500,),),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {_changePage(1);},
                    child: Container(
                      width: 112,
                      height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 1 ? SColors.color9.withOpacity(0.6) : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),),
                      ),
                      child: Center(
                        child: Text('Media', style: TextStyle(color: SColors.color3, overflow: TextOverflow.ellipsis, fontSize: 10, fontWeight: FontWeight.w500,),),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {_changePage(2);},
                    child: Container(
                      width: 112,
                      height: 26,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 2 ? SColors.color9.withOpacity(0.6) : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),),
                      ),
                      child: Center(
                        child: Text(
                          'Audio', style: TextStyle(color: SColors.color3, overflow: TextOverflow.ellipsis, fontSize: 10, fontWeight: FontWeight.w500,),),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {_changePage(3);},
                    child: Container(
                      width: 75,
                      height: 25,
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: _currentPage == 3 ? SColors.color9.withOpacity(0.6) : SColors.color9.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Document', style: TextStyle(color: SColors.color3, overflow: TextOverflow.ellipsis, fontSize: 10, fontWeight: FontWeight.w500,),),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(controller: _pageController,
              onPageChanged: (int page) {
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


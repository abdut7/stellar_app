import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/view/chat/widgets/photo_view_widget.dart';
import 'package:stellar_chat/controllers/search_controllers.dart';

class SearchMediaScreen extends StatefulWidget {
  const SearchMediaScreen({super.key});
  @override
  State<SearchMediaScreen> createState() => _SearchMediaScreenState();
}

class _SearchMediaScreenState extends State<SearchMediaScreen> {
  @override
  Widget build(BuildContext context) {
    ChatSearchController searchController = Get.find();

    return Obx(() => searchController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : searchController.mediaChatList.isEmpty
            ? const Center(child: Text("No Medias available",style:TextStyle(
          fontFamily: 'Inter',)))
            : GridView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                ),
                itemCount: searchController.mediaChatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => PhotoViewScreen(
                            imageUrl: searchController.mediaChatList
                                .elementAt(index)
                                .strUrl
                                .trim()));
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              searchController.mediaChatList
                                  .elementAt(index)
                                  .strUrl
                                  .trim(),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: SColors.color9.withOpacity(0.4),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}

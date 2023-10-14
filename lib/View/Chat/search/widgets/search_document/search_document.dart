import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/chat/search/widgets/search_document/widgets/search_document_tile.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/services/download_and_open_file.dart';

import '../../../../../controllers/search_controllers.dart';

class SearchDocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatSearchController searchController = Get.find();

    return Obx(() => searchController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : searchController.documentChatList.isEmpty
            ? const Center(child: Text("No Document available"))
            : ListView.separated(
                itemBuilder: (context, index) {
                  String fileName = searchController.documentChatList
                      .elementAt(index)
                      .strMessage;
                  return SearchDocumentListTile(
                      fileUrl: searchController.documentChatList
                          .elementAt(index)
                          .strUrl
                          .trim(),
                      fileType: fileName,
                      fileSize: '10-Pages- 1mb -PDF',
                      time: '12:O6 pm',
                      svgAssetPath: fileName.contains(".png")
                          ? SSvgs.jpgLogo
                          : fileName.contains(".pdf")
                              ? SSvgs.pdfLogo
                              : fileName.contains(".m4a")
                                  ? SSvgs.audioLogo
                                  : "assets/Svgs/unknown_doc.svg");
                },
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 0.7,
                        color: Colors.grey,
                      ),
                    ),
                itemCount: searchController.documentChatList.length));
  }
}

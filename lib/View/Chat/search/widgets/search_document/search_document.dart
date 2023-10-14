import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/chat/search/widgets/search_document/widgets/search_document_tile.dart';
import 'package:flutter/material.dart';

import '../../../../../controllers/search_controllers.dart';

class SearchDocumentScreen extends StatelessWidget {
  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        thickness: 0.7,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ChatSearchController searchController = Get.find();

    return ListView(
      children: [
        SearchDocumentListTile(
            onPressed: () {},
            fileType: 'membership.pdf',
            fileSize: '10-Pages- 1mb -PDF',
            time: '12:O6 pm',
            svgAssetPath: SSvgs.pdfLogo),
        divider(),
        SearchDocumentListTile(
          onPressed: () {},
          fileType: 'audio.mp3',
          fileSize: '3 mb - mp3',
          time: '11:35 am',
          svgAssetPath: SSvgs.audioLogo,
        ),
        divider(),
        SearchDocumentListTile(
            onPressed: () {},
            fileType: 'Roastersheet.pdf',
            fileSize: '15-Pages- 8mb -PDF',
            time: '11:O6 am',
            svgAssetPath: SSvgs.pdfLogo),
        divider(),
        SearchDocumentListTile(
            onPressed: () {},
            fileType: 'onam.jpg',
            fileSize: '8mb -PDF',
            time: '11:O5 am',
            svgAssetPath: SSvgs.jpgLogo),
        divider(),
        SearchDocumentListTile(
          onPressed: () {},
          fileType: 'audio.mp3',
          fileSize: '3 mb - mp3',
          time: '11:35 am',
          svgAssetPath: SSvgs.audioLogo,
        ),
        divider(),
        SearchDocumentListTile(
            onPressed: () {},
            fileType: 'Roastersheet.pdf',
            fileSize: '15-Pages- 8mb -PDF',
            time: '11:O6 am',
            svgAssetPath: SSvgs.pdfLogo),
        divider(),
      ],
    );
  }
}

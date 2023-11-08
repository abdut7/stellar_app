import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/Chat/chat_screen/widgets/report_and_bloc_sheet_widget.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/chat_appbar_title_widget.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/chat_bubble.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/show_attachment.dart';
import 'package:stellar_chat/View/chat/widgets/sent_contact/pick_contact_screen.dart';
import 'package:stellar_chat/View/chat/widgets/sent_location/sent_location_screen.dart';
import 'package:stellar_chat/View/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/constants/stickers.dart';
import 'package:stellar_chat/controllers/private_chat_controller.dart';
import 'package:stellar_chat/functions/hive_functions.dart';
import 'package:stellar_chat/services/api_services/chat_message_service.dart';
import 'package:stellar_chat/services/socket_service/private_chat_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_chat/services/socket_service/sent_join_room_event_socket.dart';

import '../../../functions/pick_image.dart';
import '../widgets/bottom_field_sent_widget.dart';
import 'model/message_model.dart';

class PrivateChatScreen extends StatefulWidget {
  final String chatId;
  final String fullName;
  final String imageUrl;
  const PrivateChatScreen(
      {super.key,
      required this.chatId,
      required this.fullName,
      required this.imageUrl});

  @override
  // ignore: library_private_types_in_public_api
  _PrivateChatScreenState createState() => _PrivateChatScreenState();
  final isBlocked = false;
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  final List<Message> messages = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ChatMessageService.getMessages(chatId: widget.chatId, type: "private");
  }

  @override
  void dispose() {
    sentRoomLeftSocket(chatId: widget.chatId, type: "private");
    PrivateChatController chatController = Get.put(PrivateChatController());
    chatController.messageList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PrivateChatController chatController = Get.put(PrivateChatController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(159, 196, 232, 1),
        elevation: 0,
        title: InkWell(
          onTap: () {
            Get.to(() => PublicProfileScreen(
                  uid: widget.chatId,
                  isFromChatScreen: true,
                ));
          },
          child: ChatAppBarTitleWidget(
            profileImage: widget.imageUrl.isEmpty ? null : widget.imageUrl,
            isOnline: false,
            name: widget.fullName,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.string(
                """<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M19.6 6.53353C19.6 5.2446 18.5556 4.2002 17.2667 4.2002H3.26668C1.97775 4.2002 0.93335 5.2446 0.93335 6.53353V21.4669C0.93335 22.7558 1.97775 23.8002 3.26668 23.8002H17.2667C18.5556 23.8002 19.6 22.7558 19.6 21.4669V6.53353Z" fill="#F5F5F5"/>
<path d="M25.508 6.5332C25.3045 6.5332 25.1034 6.57334 24.9149 6.6508L21.4667 8.0704V19.9293L24.9149 21.3489C25.1034 21.4264 25.305 21.4665 25.508 21.4665C26.369 21.4665 27.0667 20.7689 27.0667 19.9079V8.09187C27.0667 7.23087 26.369 6.5332 25.508 6.5332Z" fill="#F5F5F5"/>
</svg>
"""),
            onPressed: () {
              // Handle video call
            },
          ),
          IconButton(
            icon: SvgPicture.string(
                """<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M21.2226 15.4119L18.1748 12.4813C17.0863 11.4346 15.2358 11.8533 14.8004 13.2139C14.4739 14.1559 13.3853 14.6793 12.4057 14.4699C10.2287 13.9466 7.28967 11.2253 6.74542 9.02732C6.41886 8.0853 7.07197 7.03865 8.05163 6.7247C9.4667 6.30604 9.90211 4.52674 8.81359 3.4801L5.76575 0.549489C4.89494 -0.183163 3.58873 -0.183163 2.82677 0.549489L0.758593 2.53812C-1.30958 4.63141 0.976295 10.1786 6.09231 15.0979C11.2083 20.0171 16.9774 22.3198 19.1545 20.2264L21.2226 18.2378C21.9846 17.4005 21.9846 16.1445 21.2226 15.4119Z" fill="#F5F5F5"/>
</svg>
"""),
            onPressed: () {
              // Handle voice call
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {
              showBlockAndReportBottomSheet(
                  context: context,
                  id: widget.chatId,
                  onViewProfile: () {
                    Get.back();
                    Get.to(() => PublicProfileScreen(
                          uid: widget.chatId,
                          isFromChatScreen: true,
                        ));
                  });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Obx(() {
            print("Added new message");
            return Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                    reverse: true,
                    itemCount: chatController.messageList.length,
                    itemBuilder: (context, index) {
                      final reversedIndex =
                          chatController.messageList.length - 1 - index;
                      return ChatBubble(
                        message:
                            chatController.messageList.elementAt(reversedIndex),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
          ChatBottomFieldSent(
              onSticker: () {
                showModalBottomSheet(
                  backgroundColor: const Color.fromRGBO(221, 221, 221, 1),
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (context) {
                    return DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 5,
                            width: Get.width * 0.6,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 51, 142, 0.5),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TabBar(
                              labelColor: Color.fromRGBO(0, 51, 142, 1),
                              tabs: [
                                Tab(
                                  text: "Recent",
                                ),
                                Tab(
                                  text: "Favorites",
                                ),
                              ]),
                          Expanded(
                            child: TabBarView(children: [
                              GridView.count(
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 4,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 2,
                                children: List.generate(
                                    stickerGalleryList.length, (index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        PrivateChatService
                                            .sentPersonalStickerMessage(
                                                widget.chatId,
                                                stickerGalleryList
                                                    .elementAt(index)
                                                    .path);
                                        Get.back();
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: AssetImage(stickerGalleryList
                                                .elementAt(index)
                                                .path), // Add your image URL here
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              //fav tab
                              GridView.count(
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 4,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 2,
                                children: List.generate(
                                    fetchFavoritStickers().length, (index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        PrivateChatService
                                            .sentPersonalStickerMessage(
                                                widget.chatId,
                                                fetchFavoritStickers()
                                                    .elementAt(index));
                                        Get.back();
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                fetchFavoritStickers().elementAt(
                                                    index)), // Add your image URL here
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ]),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              chatId: widget.chatId,
              controller: controller,
              onsent: () async {
                if (controller.text.isNotEmpty) {
                  PrivateChatService.sentPersonalTextMessage(
                      widget.chatId, controller.text.trim());

                  controller.clear();
                }
              },
              onCamera: () async {
                XFile? image = await pickImageFromGalleryOrCamera(
                    source: ImageSource.camera);
                if (image != null) {
                  PrivateChatService.sentPersonalImageMessage(
                      widget.chatId, image);
                }
              },
              onAttach: () {
                showChatAttachmentSheet(
                  isFromPrivate: true,
                  context: context,
                  onTap: (index) async {
                    //if index = 0 =>Send Files
                    if (index == 0) {
                      Get.back();
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.any,
                      );
                      if (result != null) {
                        PrivateChatService.sentPersonalDocumentMessage(
                            chatId: widget.chatId, path: result.paths.first!);
                      }
                    }
                    if (index == 3) {
                      Get.back();
                      await Get.to(() => SendLocationScreen(
                            chatId: widget.chatId,
                            isFromGroup: false,
                          ));
                    }
                    //if index = 1 =>Camera
                    // if (index == 1) {
                    //   XFile? image = await pickImageFromGalleryOrCamera(
                    //       source: ImageSource.camera);
                    //   if (image != null) {
                    //     PrivateChatService.sentPersonalImageMessage(
                    //         widget.chatId, image);
                    //   }
                    // }
                    //if index = 2 =>Gallary
                    if (index == 2) {
                      XFile? image = await pickImageFromGalleryOrCamera(
                          source: ImageSource.gallery);
                      if (image != null) {
                        PrivateChatService.sentPersonalImageMessage(
                            widget.chatId, image);
                        Navigator.pop(context);
                      }
                    }
                    if (index == 4) {
                      await Get.to(
                        () => PickContactFromPhoneToSent(
                          chatId: widget.chatId,
                          isGroup: false,
                        ),
                      );
                    }

                    // Navigator.pop(context);
                    //if index = 3 =>Location
                    //if index = 4 =>Contacts
                    //if index = 5 =>Audio
                  },
                );
              })
        ],
      ),
    );
  }
}

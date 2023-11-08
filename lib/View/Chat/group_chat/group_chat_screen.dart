import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/View/Chat/group_chat/widgets/group_chat_options_bottomsheet.dart';
import 'package:stellar_chat/View/chat/chat_screen/widgets/show_attachment.dart';
import 'package:stellar_chat/View/chat/group_chat/group_info/group_info_screen.dart';
import 'package:stellar_chat/View/chat/group_chat/widgets/group_chat_bubble.dart';
import 'package:stellar_chat/View/chat/widgets/bottom_field_sent_widget.dart';
import 'package:stellar_chat/View/chat/widgets/sent_contact/pick_contact_screen.dart';
import 'package:stellar_chat/View/chat/widgets/sent_location/sent_location_screen.dart';
import 'package:stellar_chat/constants/stickers.dart';
import 'package:stellar_chat/controllers/group_chat_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/functions/hive_functions.dart';
import 'package:stellar_chat/models/api_models/chat_history_model.dart';
import 'package:stellar_chat/models/group_chat/group_message_model.dart';
import 'package:stellar_chat/services/api_services/group_service.dart';
import 'package:stellar_chat/services/socket_service/group_chat_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_chat/services/socket_service/sent_join_room_event_socket.dart';
import 'package:stellar_chat/utils/colors.dart';

import '../../../functions/pick_image.dart';

// ignore: must_be_immutable
class GroupChatScreen extends StatefulWidget {
  final ChatHistoryList chatHistoryList;
  GroupChatScreen({super.key, required this.chatHistoryList});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  TextEditingController messageConteroller = TextEditingController();

  GroupChatController groupChatController = Get.put(GroupChatController());

  @override
  void initState() {
    super.initState();
    GroupServices.getGroupMessage(groupId: widget.chatHistoryList.strChatId);
  }

  @override
  void dispose() {
    groupChatController.groupMessageList.clear();
    sentRoomLeftSocket(chatId: widget.chatHistoryList.strChatId, type: "group");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(159, 196, 232, 1),
        title: GestureDetector(
          onTap: () {
            Get.to(
              () => GroupInfoScreen(
                chatId: widget.chatHistoryList.strChatId,
              ),
            );
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.string(
                    """<svg width="44" height="44" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M25.6095 13.0575C26.1302 13.5782 26.1302 14.4224 25.6095 14.9431L18.5523 22.0003L25.6095 29.0575C26.1302 29.5782 26.1302 30.4224 25.6095 30.9431C25.0888 31.4638 24.2446 31.4638 23.7239 30.9431L15.7239 22.9431C15.2032 22.4224 15.2032 21.5782 15.7239 21.0575L23.7239 13.0575C24.2446 12.5368 25.0888 12.5368 25.6095 13.0575Z" fill="white"/>
              </svg>
              """),
              ),
              CachedNetworkImage(
                imageUrl: widget.chatHistoryList.strIconURL
                            .contains("undefined") ||
                        widget.chatHistoryList.strIconURL.isEmpty
                    ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                    : widget.chatHistoryList.strIconURL,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
                placeholder: (context, url) => const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  widget.chatHistoryList.strName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: colorPrimary),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              groupChatMainBottomSheet(
                  context, widget.chatHistoryList.strChatId);
              // Implement your menu actions here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Obx(() {
            if (groupChatController.isErrorOccured.value) {
              return const Expanded(
                child: Center(
                  child: Text("Error occured while loading"),
                ),
              );
            }
            if (groupChatController.isLoading.value) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (groupChatController.groupMessageList.isEmpty) {
              return const Spacer();
            }

            return Expanded(
              flex: 5,
              child: ListView.builder(
                reverse: true, // Set reverse to true
                itemCount: groupChatController.groupMessageList.length,
                itemBuilder: (context, index) {
                  int reversedIndex =
                      groupChatController.groupMessageList.length - 1 - index;
                  GroupMessageModel model =
                      groupChatController.groupMessageList[reversedIndex];
                  return GroupChatBubble(
                    senderName: model.strName,
                    // message: model.strMessage,
                    message: model,
                    alignment: !model.strMessageType.contains("senting") &&
                            model.strUserId !=
                                userController.userDetailsModel.value!.id
                        ? BubbleAlignment.left
                        : BubbleAlignment.right,
                  );
                },
              ),
            );
          }),

          // Message input field
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
                              children: List.generate(stickerGalleryList.length,
                                  (index) {
                                return Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      GroupChatService.sentGroupStickerMessage(
                                          widget.chatHistoryList.strChatId,
                                          stickerGalleryList
                                              .elementAt(index)
                                              .path);
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                          image: AssetImage(stickerGalleryList
                                              .elementAt(index)
                                              .path), // Add your image URL here
                                          fit: BoxFit.contain,
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
                                      GroupChatService.sentGroupStickerMessage(
                                          widget.chatHistoryList.strChatId,
                                          fetchFavoritStickers()
                                              .elementAt(index));
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              fetchFavoritStickers().elementAt(
                                                  index)), // Add your image URL here
                                          fit: BoxFit.contain,
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
            chatId: widget.chatHistoryList.strChatId,
            controller: messageConteroller,
            isGroup: true,
            onsent: () {
              if (messageConteroller.text.isNotEmpty) {
                GroupChatService.sentGroupTextMessage(
                    widget.chatHistoryList.strChatId,
                    messageConteroller.text.trim());

                messageConteroller.clear();
              }
            },
            onCamera: () async {
              XFile? image = await pickImageFromGalleryOrCamera(
                  source: ImageSource.camera);
              if (image != null) {
                GroupChatService.sentGroupImageMessage(
                    widget.chatHistoryList.strChatId, image);
              }
            },
            onAttach: () {
              showChatAttachmentSheet(
                context: context,
                onTap: (index) async {
                  //if index = 0 =>Send Files
                  //if index = 1 =>Camera
                  // XFile? image = await pickImageFromGalleryOrCamera(
                  //     source: index == 1
                  //         ? ImageSource.camera
                  //         : ImageSource.gallery);
                  // if (image != null) {
                  //   GroupChatService.sentGroupImageMessage(
                  //       widget.chatHistoryList.strChatId, image);
                  // }
                  if (index == 0) {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.any,
                    );
                    if (result != null) {
                      GroupChatService.sentGroupDocumentMessage(
                          chatId: widget.chatHistoryList.strChatId,
                          path: result.paths.first!);
                    }
                  }
                  if (index == 1 || index == 2) {
                    XFile? image = await pickImageFromGalleryOrCamera(
                        source: index == 1
                            ? ImageSource.camera
                            : ImageSource.gallery);
                    if (image != null) {
                      GroupChatService.sentGroupImageMessage(
                          widget.chatHistoryList.strChatId, image);
                    }
                  }
                  if (index == 3) {
                    await Get.to(() => SendLocationScreen(
                          chatId: widget.chatHistoryList.strChatId,
                          isFromGroup: true,
                        ));
                  }
                  if (index == 4) {
                    await Get.to(() => PickContactFromPhoneToSent(
                          chatId: widget.chatHistoryList.strChatId,
                          isGroup: true,
                        ));
                  }

                  //if index = 3 =>Location
                  //if index = 4 =>Contacts
                  //if index = 5 =>Audio
                  Navigator.pop(context);
                },
              );
            },
          )
        ],
      ),
    );
  }
}

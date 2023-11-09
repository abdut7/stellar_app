import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/contact/create_group/select_participents_screen.dart';
import 'package:stellar_chat/view/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/view/chat/group_chat/group_info/group_description_screen/group_description_screen.dart';
import 'package:stellar_chat/view/chat/chat_screen/chat_screen.dart';
import 'package:stellar_chat/view/chat/group_chat/group_info/widgets/group_participent_more.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:stellar_chat/services/api_services/chat_history_service.dart';
import 'package:stellar_chat/services/api_services/group_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/group_chat/group_details_model.dart';
import '../../../../utils/colors.dart';

class GroupInfoScreen extends StatefulWidget {
  final String chatId;
  const GroupInfoScreen({super.key, required this.chatId});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    UserController controller = Get.find();
    return Scaffold(
      backgroundColor:
          themeController.isDarkTheme.value ? SColors.darkmode : SColors.color4,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: themeController.isDarkTheme.value
                ? SColors.color4
                : SColors.color3,
            size: 20, // Change the color to your desired color
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.more_vert, color: Colors.black),
        //     onPressed: () {
        //       // Implement your menu actions here
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder<GroupDetailsResponseModel?>(
          future: GroupServices.getGroupDetails(groupId: widget.chatId),
          builder:
              (context, AsyncSnapshot<GroupDetailsResponseModel?> snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            GroupDetailsResponseModel resModel = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //top  group icon

                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!.strIconURL
                                    .contains("undefined") ||
                                snapshot.data!.strIconURL.isEmpty
                            ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                            : snapshot.data!.strIconURL),
                        radius:
                            50.0, // Adjust the size of the circle avatar as needed
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        resModel.strGroupName,
                        style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Group : ${resModel.intParticipants} Participants",
                        style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Add button
                    resModel.isAdmin
                        ? GestureDetector(
                            onTap: () {
                              Get.to(() => SelectGroupParticipents(
                                    groupId: widget.chatId,
                                    grpName: resModel.strGroupName,
                                    isCreatedGroup: true,
                                  ));
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            themeController.isDarkTheme.value
                                                ? SColors.color26
                                                : SColors.color12,
                                        child: const Icon(Icons.person),
                                      ),
                                      CircleAvatar(
                                        radius: 7,
                                        backgroundColor:
                                            themeController.isDarkTheme.value
                                                ? SColors.color3
                                                : secondaryColor,
                                        child: Icon(
                                          Icons.add,
                                          size: 9,
                                          color:
                                              themeController.isDarkTheme.value
                                                  ? SColors.color4
                                                  : SColors.color12,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                      color: themeController.isDarkTheme.value
                                          ? SColors.color4
                                          : SColors.color3,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (!resModel.isAdmin) {
                          return;
                        }
                        Get.to(() => GroupDescriptionScreen(
                              chatId: widget.chatId,
                              discription: resModel.strDiscription,
                            ));
                      },
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 1,
                              color: themeController.isDarkTheme.value
                                  ? SColors.color26
                                  : SColors.color3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                resModel.strDiscription,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: themeController.isDarkTheme.value
                                      ? SColors.color4
                                      : SColors.color3,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                "Created by : ${resModel.strCreatedBy}, ${DateFormat('dd/MM/yyyy').format(DateTime.parse(resModel.strCreatedTime))}",
                                style: TextStyle(
                                    color: themeController.isDarkTheme.value
                                        ? SColors.color26
                                        : const Color.fromRGBO(91, 91, 91, 1)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 1,
                              color: themeController.isDarkTheme.value
                                  ? SColors.color26
                                  : SColors.color3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${resModel.intParticipants} Participants",
                            style: TextStyle(
                                color: themeController.isDarkTheme.value
                                    ? SColors.color26
                                    : const Color.fromRGBO(91, 91, 91, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          resModel.isAdmin
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(SelectGroupParticipents(
                                      groupId: widget.chatId,
                                      grpName: resModel.strGroupName,
                                      isCreatedGroup: true,
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, bottom: 8, top: 8),
                                    child: Text(
                                      "Add Participants",
                                      style: TextStyle(
                                          color:
                                              themeController.isDarkTheme.value
                                                  ? SColors.color4
                                                  : SColors.color3,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                if (resModel.groupUser[index].strUserId ==
                                    controller.userDetailsModel.value!.id) {
                                  return;
                                }
                                if (!resModel.isAdmin) {
                                  Get.to(
                                    () => PublicProfileScreen(
                                        uid: resModel
                                            .groupUser[index].strUserId),
                                  );
                                  return;
                                }
                                showParticipentsMoreBottomSheet(
                                  context,
                                  isAdmin: resModel.groupUser[index].isAdmin,
                                  messageCallback: () {
                                    Get.to(() => PrivateChatScreen(
                                        chatId:
                                            resModel.groupUser[index].strUserId,
                                        fullName: resModel
                                            .groupUser[index].strFullName,
                                        imageUrl: resModel
                                            .groupUser[index].strProfileIcon));
                                  },
                                  removeUserCallback: () async {
                                    bool result =
                                        await GroupServices.removeUser(
                                            uid: resModel
                                                .groupUser[index].strUserId,
                                            chatID: widget.chatId);
                                    if (result) {
                                      showCustomSnackbar(
                                          title: "User removed succesfully",
                                          message: "");
                                    } else {
                                      showCustomSnackbar(
                                          title: "Failed to remove user",
                                          message: "");
                                    }
                                    setState(() {});
                                  },
                                  viewUserCallback: () {
                                    Get.to(
                                      () => PublicProfileScreen(
                                          uid: resModel
                                              .groupUser[index].strUserId),
                                    );
                                  },
                                  makeGroupAdminCallback: () async {
                                    bool result =
                                        await GroupServices.makeGroupAdmin(
                                      uid: resModel.groupUser[index].strUserId,
                                      chatID: widget.chatId,
                                      makeAdmin:
                                          !resModel.groupUser[index].isAdmin,
                                    );
                                    if (result) {
                                      showCustomSnackbar(
                                          title:
                                              resModel.groupUser[index].isAdmin
                                                  ? "Removed admin succesfuly"
                                                  : "Made Admin Succesfully",
                                          message: "");
                                      setState(() {});
                                    } else {
                                      showCustomSnackbar(
                                          title: "Made Admin Failed",
                                          message: "");
                                    }
                                  },
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    resModel.groupUser[index].strProfileIcon),
                              ),
                              title: Text(
                                resModel.groupUser[index].strFullName,
                                style: TextStyle(
                                  color: themeController.isDarkTheme.value
                                      ? SColors.color4
                                      : SColors.color3,
                                ),
                              ),
                              trailing: resModel.groupUser[index].isAdmin
                                  ? const Text(
                                      "Admin",
                                      style: TextStyle(color: Colors.green),
                                    )
                                  : const SizedBox(),
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: resModel.groupUser.length),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.string(
                            """<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_829_954)">
              <path d="M14.4867 2.51329C12.8825 0.910378 10.7605 0 8.5 0C3.82977 0 0 3.82171 0 8.5C0 13.1783 3.82036 17 8.5 17C13.1796 17 17 13.1958 17 8.5C17 6.23817 16.0896 4.11755 14.4867 2.51329ZM8.5 14.9748C4.92169 14.9748 2.02515 12.0864 2.02515 8.5C2.02515 7.10552 2.46353 5.78097 3.27037 4.68502L12.315 13.7189C11.219 14.5351 9.89448 14.9735 8.5 14.9735V14.9748ZM13.7189 12.315L4.68502 3.27037C5.78097 2.46353 7.10552 2.02515 8.5 2.02515C12.0783 2.02515 14.9748 4.91362 14.9748 8.5C14.9748 9.89448 14.5365 11.219 13.7202 12.315H13.7189Z" fill="#FF2B42"/>
              </g>
              <defs>
              <clipPath id="clip0_829_954">
              <rect width="17" height="17" fill="white"/>
              </clipPath>
              </defs>
              </svg>
              """),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            if (resModel.isAdmin) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You cannot exit the group because you are an admin'),
                                ),
                              );
                              return;
                            }
                            if (resModel.strCreatedId ==
                                    controller.userDetailsModel.value!.id &&
                                resModel.intParticipants > 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You cannot exit the group because you created it.'),
                                ),
                              );
                              return;
                            }

                            //exit group here
                            // call exit group api here
                            bool isExitSuccess =
                                await GroupServices.exitGroup(widget.chatId);
                            if (isExitSuccess) {
                              await ChatHistoryServiceApi.getChatHistory();
                              Get.back();
                              Get.back();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Succesfully Exited'),
                              ));
                            }
                          },
                          child: const Text(
                            "Exit Group",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.string(
                            """<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_829_952)">
              <path d="M8.5 0C3.80525 0 0 3.80525 0 8.5C0 13.1948 3.80525 17 8.5 17C13.1948 17 17 13.1948 17 8.5C17 3.80525 13.1934 0 8.5 0ZM8.5 14.0426C7.88729 14.0426 7.39148 13.5468 7.39148 12.9341C7.39148 12.3214 7.88729 11.8256 8.5 11.8256C9.11271 11.8256 9.60852 12.3214 9.60852 12.9341C9.60852 13.5468 9.11271 14.0426 8.5 14.0426ZM9.60852 9.97803C9.60046 10.5867 9.10868 11.0785 8.5 11.0865C7.89132 11.0785 7.39954 10.5867 7.39148 9.97803V4.46902C7.39148 3.85631 7.88729 3.3605 8.5 3.3605C9.11271 3.3605 9.60852 3.85631 9.60852 4.46902V9.97803Z" fill="#FF2B42"/>
              </g>
              <defs>
              <clipPath id="clip0_829_952">
              <rect width="17" height="17" fill="white"/>
              </clipPath>
              </defs>
              </svg>
              """),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Report Group",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

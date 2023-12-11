import 'package:stellar_chat/view/chat/chat_screen/chat_screen.dart';
import 'package:stellar_chat/view/profile/public_profile/widgets/follow_details_widget.dart';
import 'package:stellar_chat/view/profile/widget/channel_grid_view.dart';
import 'package:stellar_chat/view/profile/widget/contact_through_options.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/capitalize_names.dart';
import 'package:stellar_chat/models/api_models/user_details_model.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:stellar_chat/services/api_services/public_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/profile/widget/flick_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PublicProfileScreen extends StatefulWidget {
  final bool isFromChatScreen;

  final String uid;

  const PublicProfileScreen(
      {super.key, required this.uid, this.isFromChatScreen = false});

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  UserDetailsModel? userDetailsModel;
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return SafeArea(
        child: Scaffold(
      backgroundColor:
          themeController.isDarkTheme.value ? SColors.darkmode : SColors.color4,
      body: RefreshIndicator(
        onRefresh: () async {
          userDetailsModel = await PublicProfileService()
              .getPublicProfileData(uid: widget.uid);
          // setState(() {});
        },
        child: FutureBuilder(
            future:
                PublicProfileService().getPublicProfileData(uid: widget.uid),
            builder: (context, AsyncSnapshot<UserDetailsModel?> snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              userDetailsModel = snapshot.data;
              return DefaultTabController(
                length: 2,
                child: ListView(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              userDetailsModel!.strProfileUrl.isEmpty
                                  ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                                  : userDetailsModel!.strProfileUrl,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          showBottomSheet(context, 'profile',
                                              userDetailsModel!);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 28, bottom: 28),
                                          child: SvgPicture.asset(
                                            SSvgs.moreVertz,
                                            width: 10,
                                            height: 20,
                                            color: themeController
                                                    .isDarkTheme.value
                                                ? SColors.color3
                                                : SColors.color11,
                                          ),
                                        )),
                                  ],
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * 0.2,
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    gradient: LinearGradient(
                                      colors: [
                                        themeController.isDarkTheme.value
                                            ? SColors.darkmode
                                            : SColors.color4,
                                        themeController.isDarkTheme.value
                                            ? Colors.transparent
                                            : Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [
                                        0.0,
                                        5
                                      ], // Adjust the stops for the gradient effect
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        capitalizeNames(userDetailsModel!
                                            .strName
                                            .toUpperCase()),
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color:
                                              themeController.isDarkTheme.value
                                                  ? SColors.color4
                                                  : SColors.color3,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'PHONE NUMBER : ${userDetailsModel!.strMobileNo}',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color:
                                              themeController.isDarkTheme.value
                                                  ? SColors.color4
                                                  : SColors.color3,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                        // Column(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         GestureDetector(
                        //             onTap: () {},
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: SvgPicture.asset(SSvgs.sv29),
                        //             )),
                        //       ],
                        //     ),
                        //     const Spacer(),
                        //     Text(
                        //       userDetailsModel!.strName,
                        //       style: TextStyle(fontFamily: 'Inter',
                        //         color: SColors.color3,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w800,
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     Text(
                        //       'PHONE NUMBER : ${userDetailsModel!.strMobileNo}',
                        //       style: TextStyle(fontFamily: 'Inter',
                        //         color: SColors.color3,
                        //         fontSize: 11,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     )
                        //   ],
                        // ),
                        ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.isFromChatScreen) {
                              Get.back();
                            } else {
                              Get.to(PrivateChatScreen(
                                  chatId: userDetailsModel!.id,
                                  fullName: userDetailsModel!.strName,
                                  imageUrl: userDetailsModel!.strProfileUrl));
                            }
                          },
                          child: ContactThrough(
                              svgAsset: themeController.isDarkTheme.value
                                  ? SSvgs.pMessageDark
                                  : SSvgs.pMessage,
                              label: 'Message'),
                        ),
                        ContactThrough(
                            svgAsset: themeController.isDarkTheme.value
                                ? SSvgs.pCallDark
                                : SSvgs.pCall,
                            label: 'Call'),
                        //const SizedBox(),
                        ContactThrough(
                            svgAsset: themeController.isDarkTheme.value
                                ? SSvgs.pVideoDark
                                : SSvgs.pVideo,
                            label: 'Video'),
                        //const SizedBox(),
                        ContactThrough(
                            svgAsset: SSvgs.sendMoneyIcon, label: 'Send'),
                        //const SizedBox(width: 1,),
                        ContactThrough(
                            svgAsset: SSvgs.requestMoneyIcon, label: 'Request'),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FollowDetailsWidget(
                        model: userDetailsModel!, uid: widget.uid),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'About Me\n',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: themeController.isDarkTheme.value
                                      ? SColors.color4
                                      : SColors.color3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: userDetailsModel!.strAbout,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: themeController.isDarkTheme.value
                                      ? SColors.color26
                                      : SColors.color3,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Divider(
                        color: themeController.isDarkTheme.value
                            ? SColors.color26
                            : SColors.color3,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TabBar(
                        indicatorColor: SColors.color9.withOpacity(0.5),
                        tabs: [
                          Tab(
                            icon: SvgPicture.asset(SSvgs.flicksLogo,
                                width: 30,
                                height: 30,
                                color: selectedTabIndex == 0
                                    ? themeController.isDarkTheme.value
                                        ? SColors.color27
                                        : null
                                    : themeController.isDarkTheme.value
                                        ? SColors.color27.withOpacity(0.5)
                                        : Colors.grey),
                          ),
                          Tab(
                            icon: SvgPicture.asset(SSvgs.channelLogo,
                                width: 30,
                                height: 30,
                                color: selectedTabIndex == 1
                                    ? themeController.isDarkTheme.value
                                        ? SColors.color27
                                        : null
                                    : themeController.isDarkTheme.value
                                        ? SColors.color27.withOpacity(0.5)
                                        : Colors.grey),
                          ),
                        ],
                        onTap: (index) {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      child: IndexedStack(index: selectedTabIndex, children: [
                        Visibility(
                            visible: selectedTabIndex == 0,
                            child: FlickGridView(
                              id: userDetailsModel!.id,
                              icon: Icons.photo,
                            )),
                        Visibility(
                            visible: selectedTabIndex == 1,
                            child: ChannelGridView(
                              id: userDetailsModel!.id,
                            )),
                      ]),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}

void showBottomSheet(
    BuildContext context, String action, UserDetailsModel model) {
  ThemeController themeController = Get.find();
  showModalBottomSheet(
    context: context,
    backgroundColor:
        themeController.isDarkTheme.value ? SColors.darkmode : SColors.color11,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 2,
                color: themeController.isDarkTheme.value
                    ? SColors.color26
                    : Color.fromRGBO(0, 51, 142, 0.5),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                if (model.isBlocked) {
                  AccountServices.unBlockUser(model.id);
                } else {
                  AccountServices.blockUser(model.id);
                }
                Navigator.pop(context);
              },
              child: Text(
                model.isBlocked ? "Unblock" : 'Block',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: themeController.isDarkTheme.value
                      ? SColors.sheetItemColor
                      : SColors.color12,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("User Reported"),
                  ),
                );
              },
              child: Text(
                'Report',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: themeController.isDarkTheme.value
                      ? SColors.sheetItemColor
                      : SColors.color12,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

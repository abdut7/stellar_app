import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/profile/edit_profile/edit_profile.dart';
import 'package:stellar_chat/View/profile/followe_listing_page.dart';
import 'package:stellar_chat/View/profile/settings/profile_settings/profile_settings.dart';
import 'package:stellar_chat/View/profile/widget/about_me_text.dart';
import 'package:stellar_chat/View/profile/widget/channel_grid_view.dart';
import 'package:stellar_chat/View/profile/widget/flick_grid_view.dart';
import 'package:stellar_chat/View/profile/widget/profile_buttons.dart';
import 'package:stellar_chat/View/profile/widget/profile_status.dart';
import 'package:stellar_chat/controllers/new_post/new_post_common_controller.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/services/api_services/user_details_service.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    NewPostController flickController = Get.find();


    UserController controller = Get.find();
    return SafeArea(
        child: Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      body: RefreshIndicator(
        onRefresh: () async {
          await GetUserDetailsService.getUserDetails();
        },
        child: DefaultTabController(
          length: 2,
          child: ListView(
            children: <Widget>[
              Obx(() => Container(
                    height: 250,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          controller
                                  .userDetailsModel.value!.strProfileUrl.isEmpty
                              ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                              : controller
                                  .userDetailsModel.value!.strProfileUrl,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height * 0.2,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            gradient: LinearGradient(
                              colors: [
                                themeController.isDarkTheme.value
                                    ? Colors.black
                                    : Colors.white,
                                Colors.transparent,
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
                                controller.userDetailsModel.value!.strName,
                                style: TextStyle(
                                  // color: SColors.color3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'PHONE NUMBER : ${controller.userDetailsModel.value!.strMobileNo}',
                                style: TextStyle(
                                  // color: SColors.color3,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
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
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileStatus(
                        count: controller.userDetailsModel.value!.intPostCount
                            .toString(),
                        label: 'Posts'),
                    GestureDetector(
                      onTap: () {
                        // get to follower list
                        Get.to(
                          () => const FollowerListingPage(
                              page: FollowingOrFollower.following),
                        );
                      },
                      child: ProfileStatus(
                          count:
                              "${controller.userDetailsModel.value!.followingCount}",
                          label: 'Following'),
                    ),
                    GestureDetector(
                      onTap: () {
                        // get to follower list
                        Get.to(() => const FollowerListingPage(
                            page: FollowingOrFollower.followers));
                      },
                      child: ProfileStatus(
                          count:
                              "${controller.userDetailsModel.value!.followersCount}",
                          label: 'Followers'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileButton(
                        buttonText: 'Edit Profile',
                        onPressed: () {
                          Get.to(() => const EditProfile());
                        }),
                    ProfileButton(
                        buttonText: 'Settings',
                        onPressed: () {
                          Get.to(() => const ProfileSettings());
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AboutMeText(),
              //const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  // color: SColors.color3,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  indicatorColor: SColors.color9.withOpacity(0.4),
                  tabs: [
                    Tab(
                      icon: SvgPicture.asset(
                        SSvgs.flicksLogo,
                        width: 30,
                        height: 30,
                        color:

                        selectedTabIndex == 0 ?
                        themeController.isDarkTheme.value
                            ?  SColors.color27
                            : null
                            : themeController.isDarkTheme.value
                            ?  SColors.color27.withOpacity(0.5)
                            : Colors.grey
                      ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                        SSvgs.channelLogo,
                        width: 30,
                        height: 30,
                        color: selectedTabIndex == 1 ?
                        themeController.isDarkTheme.value
                            ?  SColors.color27
                            : null
                            : themeController.isDarkTheme.value
                            ?  SColors.color27.withOpacity(0.5)
                            : Colors.grey
                      ),
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IndexedStack(index: selectedTabIndex, children: [
                Visibility(
                  visible: selectedTabIndex == 0,
                  child: FlickGridView(
                    id: controller.userDetailsModel.value!.id,
                    icon: Icons.photo,
                  ),
                ),
                Visibility(
                  visible: selectedTabIndex == 1,
                  child: ChannelGridView(
                    id: controller.userDetailsModel.value!.id,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() => flickController.isPosting.value ||
              flickController.isUploading.value ||
              flickController.isUploaded.value
          ? Container(
              width: Get.width,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.8),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    flickController.isUploading.value
                        ? "Uploading.."
                        : flickController.isPosting.value
                            ? "Posting.."
                            : "Uploaded Succesfuly",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  flickController.isUploading.value
                      ? Row(
                          children: [
                            Text(
                              "${flickController.uploadPercentage.value.toString()} %",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                flickController.isCancelled(true);
                              },
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor:
                                    const Color.fromRGBO(159, 196, 232, 1),
                                child: SvgPicture.string(
                                    """<svg width="8" height="8" viewBox="0 0 8 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7 1L1.00055 6.99945" stroke="#575757" stroke-width="1.5" stroke-linecap="round"/>
                            <path d="M7 6.99951L1.00055 1.00006" stroke="#575757" stroke-width="1.5" stroke-linecap="round"/>
                            </svg>
                            """),
                              ),
                            )
                          ],
                        )
                      : flickController.isUploaded.value
                          ? CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  const Color.fromRGBO(159, 196, 232, 1),
                              child: SvgPicture.string(
                                  """<svg width="11" height="9" viewBox="0 0 11 9" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M9.49847 1.49945L3.49902 7.4989L0.999575 4.99945" stroke="#575757" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg>

"""),
                            )
                          : const SizedBox(),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            )
          : const SizedBox()),
    ));
  }
}

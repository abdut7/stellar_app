import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/profile/edit_profile/edit_profile.dart';
import 'package:stellar_chat/View/profile/settings/profile_settings/profile_settings.dart';
import 'package:stellar_chat/View/profile/widget/about_me_text.dart';
import 'package:stellar_chat/View/profile/widget/custom_grid_view.dart';
import 'package:stellar_chat/View/profile/widget/profile_buttons.dart';
import 'package:stellar_chat/View/profile/widget/profile_status.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    return SafeArea(
        child: Scaffold(
      backgroundColor: SColors.color4,
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: <Widget>[
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    controller.userDetailsModel.value!.strProfileUrl.isEmpty
                        ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                        : controller.userDetailsModel.value!.strProfileUrl,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(SSvgs.sv29),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    controller.userDetailsModel.value!.strName,
                    style: TextStyle(
                      color: SColors.color3,
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
                      color: SColors.color3,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  ProfileStatus(count: '09', label: 'Posts'),
                  ProfileStatus(
                      count:
                          "${controller.userDetailsModel.value!.followingCount}",
                      label: 'Following'),
                  ProfileStatus(
                      count:
                          "${controller.userDetailsModel.value!.followersCount}",
                      label: 'Followers'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
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
            const SizedBox(
              height: 20,
            ),
            const AboutMeText(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: SColors.color9,
                thickness: 1,
              ),
            ),
            TabBar(
              indicatorColor: SColors.color9,
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    SSvgs.flicksLogo,
                    width: 30,
                    height: 30,
                    color: selectedTabIndex == 0 ? null : Colors.grey,
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    SSvgs.channelLogo,
                    width: 30,
                    height: 30,
                    color: selectedTabIndex == 1 ? null : Colors.grey,
                  ),
                ),
              ],
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),

            SizedBox(
              // height: 200,
              child: IndexedStack(index: selectedTabIndex, children: [
                Visibility(
                    visible: selectedTabIndex == 0,
                    child: CustomGridView(
                      icon: Icons.photo,
                    )),
                Visibility(
                    visible: selectedTabIndex == 1, child: CustomGridView()),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}

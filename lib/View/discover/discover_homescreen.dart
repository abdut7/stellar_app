import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/Profile/qr/qr_screen.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/channel_home_screen.dart';
import 'package:stellar_chat/View/contact/add_contact/friends_in_radar/friends_in_radar.dart';
import 'package:stellar_chat/View/discover/widgets/discover_list_tile.dart';
import 'package:stellar_chat/View/discover/widgets/top_section.dart';
import 'package:stellar_chat/controllers/bottom_navigation_controller.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_splash_screen/stellar_pay_splash.dart';
import 'package:stellar_chat/View/flicks/flicks_player_home_screen.dart';

class DiscoverHomeScreen extends StatefulWidget {
  const DiscoverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverHomeScreen> createState() => _DiscoverHomeScreenState();
}

class _DiscoverHomeScreenState extends State<DiscoverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
    ?  SColors.darkmode
        : SColors.color4,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(SImages.bgDiscover),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const TopSection(),
                  Container(
                      //margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 210),
                      margin:
                          const EdgeInsets.only(left: 45, right: 45, top: 225),
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color:themeController.isDarkTheme.value
                            ? SColors.darkmode
                            : SColors.color4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            DiscoverListTile(
                                title: 'Flicks',
                                svgAsset:  themeController.isDarkTheme.value ? SSvgs.flicksDark
                              : SSvgs.flicksLogo,
                                onTap: () {
                                  // Get.to(() => FlicksPlayerHomeScreen());
                                  BottomNavigationController
                                      bottomNavigationController = Get.find();
                                  bottomNavigationController.bottomNavList[1]
                                      .add(
                                    FlicksPlayerHomeScreen(),
                                  );
                                  bottomNavigationController.pageCount(1);
                                }),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(
                                thickness: 2,
                                color: themeController.isDarkTheme.value
                                    ? Color.fromRGBO(187, 187, 187, 1)
                                    : Color.fromRGBO(232, 232, 232, 1)

                              ),
                            ),
                            DiscoverListTile(
                                title: 'Channel',
                                svgAsset: themeController.isDarkTheme.value ? SSvgs.channelDark
                                    : SSvgs.channelLogo,
                                onTap: () {
                                  BottomNavigationController
                                      bottomNavigationController = Get.find();
                                  bottomNavigationController.bottomNavList[1]
                                      .add(
                                    const ChannelHomeScreen(),
                                  );
                                  // bottomNavigationController.pageCount(1);
                                  // Get.to(() => const ChannelHomeScreen());
                                }),
                          ],
                        ),
                      )),
                  Container(
                      //margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 210),
                      margin:
                          const EdgeInsets.only(left: 45, right: 45, top: 385),
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: themeController.isDarkTheme.value
                            ? SColors.darkmode
                            : SColors.color4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            DiscoverListTile(
                                title: 'Scan',
                                svgAsset:  themeController.isDarkTheme.value ? SSvgs.scanDark
                                    : SSvgs.scanLogo,
                                onTap: () {
                                  Get.to(() => const QRScreen());
                                }),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(
                                thickness: 2,
                                color: themeController.isDarkTheme.value
                                    ? Color.fromRGBO(187, 187, 187, 1)
                                    : Color.fromRGBO(232, 232, 232, 1)

                              ),
                            ),
                            DiscoverListTile(
                                title: 'Stellar Pay',
                                svgAsset: SSvgs.payStellar,
                                onTap: () {
                                  // Get.to(() => const StellarPaySplashScreen());
                                  BottomNavigationController
                                      bottomNavigationController = Get.find();
                                  bottomNavigationController.bottomNavList[1]
                                      .add(const StellarPaySplashScreen());
                                  bottomNavigationController.pageCount(1);
                                }),
                          ],
                        ),
                      )),
                  Container(
                      margin:
                          const EdgeInsets.only(left: 45, right: 45, top: 545),
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: themeController.isDarkTheme.value
                            ? SColors.darkmode
                            : SColors.color4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            DiscoverListTile(
                                title: 'People Near Me',
                                svgAsset: themeController.isDarkTheme.value ? SSvgs.nearmeDark : SSvgs.nearMeIcon,
                                onTap: () {
                                  Get.to(() => const FriendsInRadarScreen());
                                }),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(
                                thickness: 2,
                                color: themeController.isDarkTheme.value
                                    ? Color.fromRGBO(187, 187, 187, 1)
                                    : Color.fromRGBO(232, 232, 232, 1)
                              ),
                            ),
                            DiscoverListTile(
                                title: 'Search',
                                svgAsset: themeController.isDarkTheme.value ? SSvgs.searchDark : SSvgs.searchIcon,
                                onTap: () {}),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

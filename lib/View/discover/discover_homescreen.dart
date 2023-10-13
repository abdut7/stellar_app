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
    return Scaffold(
      backgroundColor: SColors.color4,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(SImages.bgDiscover),
            fit: BoxFit.cover,
          ),
        ),
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
                      color: SColors.color4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      shadows: [
                        BoxShadow(
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
                              svgAsset: SSvgs.flicksLogo,
                              onTap: () {
                                Get.to(() => FlicksPlayerHomeScreen());
                              }),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 2,
                              color: Colors.black12,
                            ),
                          ),
                          DiscoverListTile(
                              title: 'Channel',
                              svgAsset: SSvgs.channelLogo,
                              onTap: () {
                                Get.to(() => const ChannelHomeScreen());
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
                      color: SColors.color4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      shadows: [
                        BoxShadow(
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
                              svgAsset: SSvgs.scanLogo,
                              onTap: () {
                                Get.to(() => const QRScreen());
                              }),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 2,
                              color: Colors.black12,
                            ),
                          ),
                          DiscoverListTile(
                              title: 'Stellar Pay',
                              svgAsset: SSvgs.payStellar,
                              onTap: () {
                                Get.to(() => const StellarPaySplashScreen());
                              }),
                        ],
                      ),
                    )),
                Container(
                    margin:
                        const EdgeInsets.only(left: 45, right: 45, top: 545),
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: SColors.color4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      shadows: [
                        BoxShadow(
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
                              svgAsset: SSvgs.nearMeIcon,
                              onTap: () {
                                Get.to(() => FriendsInRadarScreen());
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 2,
                              color: Colors.black12,
                            ),
                          ),
                          DiscoverListTile(
                              title: 'Search',
                              svgAsset: SSvgs.searchIcon,
                              onTap: () {}),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

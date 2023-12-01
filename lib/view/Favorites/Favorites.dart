import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/profile/widget/flick_grid_view.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/widgets/favorite_flicks_grid_view.dart';
import 'package:stellar_chat/widgets/favorite__channel_grid_view.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/FavoritesScreen';

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor:
          themeController.isDarkTheme.value ? SColors.darkmode : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(
            fontFamily: 'Inter',
            color: themeController.isDarkTheme.value
                ? SColors.appbarTitleInDark
                : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: themeController.isDarkTheme.value
            ? SColors.appbarbgInDark
            : SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: DefaultTabController(
          length: 2,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  indicatorColor: SColors.color9.withOpacity(0.4),
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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: IndexedStack(index: selectedTabIndex, children: [
                  Visibility(
                    visible: selectedTabIndex == 0,
                    child: FavoriteFlicksGridView(),
                  ),
                  Visibility(
                    visible: selectedTabIndex == 1,
                    child: FavoriteChannelGridView(),
                  ),
                ]),
              ), // Add a condition for the second tab if needed
            ],
          ),
        ),
      ),
    );
  }
}

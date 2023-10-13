import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/Profile/widget/flick_grid_view.dart';
import 'package:stellar_chat/widgets/favorite_grid_view_tab1.dart';
import 'package:stellar_chat/widgets/favorite_grid_view_tab2.dart';


class FavoritesScreen extends StatefulWidget {
  static const routeName = '/FavoritesScreen';

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: SColors.color12,
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
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: IndexedStack(index: selectedTabIndex, children: [
                  Visibility(
                      visible: selectedTabIndex == 0,
                      child: FavoriteGridViewTab1(icon: Icons.video_camera_back,)),
                  Visibility(
                      visible: selectedTabIndex == 1,
                      child: FavoriteGridViewTab2()),
                ]),
              ), // Add a condition for the second tab if needed
            ],
          ),
        ),
      ),
    );
  }
}


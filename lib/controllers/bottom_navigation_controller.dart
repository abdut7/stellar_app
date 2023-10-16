import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/chat/HomeChat/sub/home/home_screen.dart';
import 'package:stellar_chat/View/create_post/create_post_home.dart';
import 'package:stellar_chat/View/discover/discover_homescreen.dart';
import 'package:stellar_chat/View/profile/own_profile/main_profile.dart';

class BottomNavigationController extends GetxController {
  RxList<RxSet<Widget>> bottomNavList = RxList([
    RxSet(
      {
        const HomeScreen(),
      },
    ),
    RxSet(
      {
        const DiscoverHomeScreen(),
      },
    ),
    RxSet({
      const AddFilesHomePage(),
    }),
    RxSet({
      Container(),
    }),
    RxSet({
      const MainProfile(),
    }),
  ]);

  RxInt pageCount = RxInt(0);
  RxInt tapCount = RxInt(0);
}


  
  // const ContactsHomeScreen(),
  
  


import 'package:get/get.dart';
import 'package:stellar_chat/View/Chat/HomeChat/sub/home/home_screen.dart';
import 'package:stellar_chat/View/discover/discover_homescreen.dart';
import 'package:stellar_chat/View/profile/own_profile/main_profile.dart';
import 'package:stellar_chat/View/base_bottom_nav/widgets/bottom_nav_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import '../../Settings/SSvgs.dart';

class BaseBottomNavigation extends StatefulWidget {
  const BaseBottomNavigation({super.key});

  @override
  State<BaseBottomNavigation> createState() => _BaseBottomNavigationState();
}

List<Widget> screenList = [
  const HomeScreen(),
  // const ContactsHomeScreen(),
  const DiscoverHomeScreen(),
  Container(),
  Container(),
  const MainProfile(),
];

class _BaseBottomNavigationState extends State<BaseBottomNavigation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find();
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false, // Hide labels for selected items
        showUnselectedLabels: false, // Hide labels for unselected items
        items: [
          BottomNavigationBarItem(
              backgroundColor: controller.isDarkTheme.value
                  ? const Color.fromRGBO(79, 79, 79, 1)
                  : null,
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv09, isSelected: selectedIndex == 0),
              label: "Home"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv12, isSelected: selectedIndex == 1),
              label: "Discovery"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.bottomNavAddIcon,
                  isSelected: selectedIndex == 2),
              label: "Add"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.bottomNavNotificationIcon,
                  isSelected: selectedIndex == 3),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv10, isSelected: selectedIndex == 4),
              label: "Profile"),
        ],
        currentIndex: selectedIndex,
        onTap: (e) {
          setState(() {
            selectedIndex = e;
          });
        },
      ),
    );
  }
}

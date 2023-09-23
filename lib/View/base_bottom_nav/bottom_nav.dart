import 'package:base_project/View/Chat/HomeChat/sub/home/home_screen.dart';
import 'package:base_project/View/Profile/main_profile.dart';
import 'package:base_project/View/base_bottom_nav/widgets/bottom_nav_icon_widget.dart';
import 'package:flutter/material.dart';
import '../../Settings/SSvgs.dart';
import '../chat/HomeChat/sub/contacts/contacts_home_screen.dart';

class BaseBottomNavigation extends StatefulWidget {
  const BaseBottomNavigation({super.key});

  @override
  State<BaseBottomNavigation> createState() => _BaseBottomNavigationState();
}

List<Widget> screenList = [
  const HomeScreen(),
  const ContactsHomeScreen(),
  Container(),
  const MainProfile(),
];

class _BaseBottomNavigationState extends State<BaseBottomNavigation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv09, isSelected: selectedIndex == 0),
              label: "Home"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv11, isSelected: selectedIndex == 1),
              label: "Contacts"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv12, isSelected: selectedIndex == 2),
              label: "Discovery"),
          BottomNavigationBarItem(
              icon: BottomNavIconWidget(
                  svgPath: SSvgs.sv10, isSelected: selectedIndex == 3),
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

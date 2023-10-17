import 'package:get/get.dart';
import 'package:stellar_chat/View/base_bottom_nav/widgets/bottom_nav_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/discover/discover_homescreen.dart';
import 'package:stellar_chat/controllers/bottom_navigation_controller.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import '../../Settings/SSvgs.dart';

class BaseBottomNavigation extends StatefulWidget {
  const BaseBottomNavigation({
    super.key,
  });

  @override
  State<BaseBottomNavigation> createState() => _BaseBottomNavigationState();
}

BottomNavigationController bottomNavigationController =
    Get.put(BottomNavigationController());

int selectedIndex = 0;

class _BaseBottomNavigationState extends State<BaseBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find();

    return Obx(
      () => Scaffold(
        body: bottomNavigationController.bottomNavList
            .elementAt(bottomNavigationController.pageCount.value)
            .last,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.find<ThemeController>().isInsideDarkScreens.value
              ? Color.fromRGBO(79, 79, 79, 1)
              : null,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false, // Hide labels for selected items
          showUnselectedLabels: false, // Hide labels for unselected items
          items: [
            BottomNavigationBarItem(
                backgroundColor: controller.isDarkTheme.value ||
                        controller.isInsideDarkScreens.value
                    ? const Color.fromRGBO(79, 79, 79, 1)
                    : null,
                icon: BottomNavIconWidget(
                    svgPath: SSvgs.sv09,
                    isSelected:
                        bottomNavigationController.pageCount.value == 0),
                label: "Home"),
            BottomNavigationBarItem(
                icon: BottomNavIconWidget(
                    svgPath: SSvgs.sv12,
                    isSelected:
                        bottomNavigationController.pageCount.value == 1),
                label: "Discovery"),
            BottomNavigationBarItem(
                icon: BottomNavIconWidget(
                    svgPath: SSvgs.bottomNavAddIcon,
                    isSelected:
                        bottomNavigationController.pageCount.value == 2),
                label: "Add"),
            BottomNavigationBarItem(
                icon: BottomNavIconWidget(
                    svgPath: SSvgs.bottomNavNotificationIcon,
                    isSelected:
                        bottomNavigationController.pageCount.value == 3),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: BottomNavIconWidget(
                    svgPath: SSvgs.sv10,
                    isSelected:
                        bottomNavigationController.pageCount.value == 4),
                label: "Profile"),
          ],
          currentIndex: bottomNavigationController.pageCount.value,
          onTap: (e) {
            if (e == 1) {
              bottomNavigationController.tapCount++;
              if (bottomNavigationController.tapCount > 1) {
                bottomNavigationController.bottomNavList[e] = RxSet({
                  const DiscoverHomeScreen(),
                });
                Get.find<ThemeController>().isInsideDarkScreens(false);
                bottomNavigationController.tapCount(0);
              }
            }
            bottomNavigationController.pageCount(e);
            if (e != 1) {
              Get.find<ThemeController>().isInsideDarkScreens(false);
            }
          },
        ),
      ),
    );
  }
}

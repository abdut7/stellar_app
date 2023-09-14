import 'package:flutter/material.dart';

import '../../Chat/HomeChat/sub/contacts/contacts_home_screen.dart';
import '../../Chat/HomeChat/sub/home/home_screen.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final int index;
  TabNavigator({super.key, required this.navigatorKey, required this.index});
  List<Widget> screenList = [
    const HomeScreen(),
    const ContactsHomeScreen(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    Widget child;
    child = screenList[index];

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (x) => child);
      },
    );
  }
}

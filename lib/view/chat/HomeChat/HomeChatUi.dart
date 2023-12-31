import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/contacts/contacts_home_screen.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/Case4/Case4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/home/home_screen.dart';

class HomeChatUi extends StatefulWidget {
  static const routeName = '/HomeChatUi';

  const HomeChatUi({super.key});
  @override
  _HomeChatUiState createState() => _HomeChatUiState();
}

class _HomeChatUiState extends State<HomeChatUi> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getIcon(int index, String svgAssetPath, Color color) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: _currentIndex == index
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: SColors.color12,
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(svgAssetPath),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: _getIcon(0, SSvgs.sv09, Colors.transparent),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _getIcon(1, SSvgs.sv11, Colors.transparent),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _getIcon(2, SSvgs.sv12, Colors.transparent),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _getIcon(3, SSvgs.sv10, Colors.transparent),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ContactsHomeScreen();
      case 2:
        return Container();
      case 3:
        return const Case4();
      default:
        return Container();
    }
  }
}

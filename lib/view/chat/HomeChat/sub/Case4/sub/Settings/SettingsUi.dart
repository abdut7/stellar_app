import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/Case4/sub/EditProfile/EditProfileUi.dart';
import 'package:stellar_chat/widgets/appbarContainer.dart';
import 'package:flutter/material.dart';

class SettingsUi extends StatefulWidget {
  static const routeName = '/SettingsUi';
  const SettingsUi({Key? key}) : super(key: key);

  @override
  State<SettingsUi> createState() => _SettingsUiState();
}

class _SettingsUiState extends State<SettingsUi> {
  Widget createButtons(
      List<String> texts, List<Function> onPress, int buttonCount) {
    List<Widget> buttons = [];
    for (int i = 0; i < buttonCount; i++) {
      buttons.add(
        TextButton(
          onPressed: () {
            if (i < onPress.length) {
              onPress[i]();
            }
          },
          child: Text(
            texts[i],
            style: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: SColors.color4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buttons,
        ),
      ),
    );
  }

  Widget buildHead(String head) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        head,
        style: TextStyle(
          fontFamily: 'Inter',
          color: SColors.color3,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget containerWithFourButtons = createButtons(
      ['EDIT PROFILE', 'SECURITY', 'NOTIFICATIONS', 'PRIVACY'],
      [
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditProfileUi()),
          );
        },
        () {},
        () {},
        () {},
      ],
      4,
    );
    Widget containerWithThreeButtons = createButtons(
      ['MY SUBSCRIPTION', 'HELP & SUPPORT', 'TERMS AND POLICIES'],
      [
        () {},
        () {},
        () {},
        () {},
      ],
      3,
    );
    Widget containerWithThreeButtons1 = createButtons(
      ['REPORT A PROBLEM', 'ADD ACCOUNT ', 'LOG OUT'],
      [
        () {},
        () {},
        () {},
        () {},
      ],
      3,
    );

    return Scaffold(
      backgroundColor: SColors.color11,
      body: ListView(
        children: [
          AppBarContainer(labelText: 'Settings'),
          const SizedBox(
            height: 25,
          ),
          buildHead('ACCOUNT'),
          const SizedBox(
            height: 10,
          ),
          containerWithFourButtons,
          const SizedBox(
            height: 15,
          ),
          buildHead('SUPPORT & ABOUT'),
          const SizedBox(
            height: 10,
          ),
          containerWithThreeButtons,
          const SizedBox(
            height: 15,
          ),
          buildHead('ACTIONS'),
          const SizedBox(
            height: 10,
          ),
          containerWithThreeButtons1
        ],
      ),
    );
  }
}

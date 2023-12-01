import 'package:stellar_chat/view/chat/HomeChat/sub/Case4/sub/EditProfile/EditProfileUi.dart';
import 'package:stellar_chat/view/chat/HomeChat/sub/Case4/sub/Settings/SettingsUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/widgets/appbarContainer.dart';
import 'package:stellar_chat/widgets/tile_with_svg_title_suffix.dart';

class Case4 extends StatefulWidget {
  const Case4({Key? key}) : super(key: key);

  @override
  State<Case4> createState() => _Case4State();
}

class _Case4State extends State<Case4> {
  Widget buildProfileAvatar() {
    return CircleAvatar(
      backgroundColor: SColors.color14,
      radius: 60,
      child: SvgPicture.asset(SSvgs.sv06, height: 75),
    );
  }

  Widget buildName(String name) {
    return Text(
      name,
      style: TextStyle(
        fontFamily: 'Inter',
        color: SColors.color3,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildStellarId(String text, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            id,
            style: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddStatus(String text, Function() onpress) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.add, size: 15, color: SColors.color3),
          onPressed: onpress,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            color: SColors.color3,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget buildEditProfileButton(String text, Function() onpress) {
    return SizedBox(
      height: 28,
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            color: SColors.color3,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: SColors.color14,
          foregroundColor: SColors.color4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: ListView(
        children: [
          AppBarContainer(labelText: 'Profile'),
          const SizedBox(height: 25),
          buildProfileAvatar(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildName('NAME SURNAME'),
                const SizedBox(height: 15),
                buildStellarId(
                    'MY STELLAR CHAT ID       :', 'XXXX_XXXXXXX_XXX'),
                buildAddStatus('STATUS', () {}),
                const SizedBox(height: 10),
                buildEditProfileButton('EDIT PROFILE', () {
                  Navigator.pushNamed(context, EditProfileUi.routeName);
                }),
                const SizedBox(height: 15),
                STSTile(
                    svgAsset: SSvgs.sv25, text: 'Favorites', onPressed: () {}),
                STSTile(
                    svgAsset: SSvgs.sv26, text: 'Moments', onPressed: () {}),
                STSTile(
                    svgAsset: SSvgs.sv27,
                    text: 'Sticker Gallery',
                    onPressed: () {}),
                STSTile(
                    svgAsset: SSvgs.sv28,
                    text: 'Settings',
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsUi.routeName);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

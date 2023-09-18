import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/Chat/HomeChat/HomeChatUi.dart';
import 'package:base_project/widgets/appbarContainer.dart';
import 'package:base_project/widgets/custom_popup_menu_item.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:base_project/widgets/tile_with_CT.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectContactUi extends StatefulWidget {
  static const routeName = '/SelectContactUi';
  const SelectContactUi({Key? key}) : super(key: key);

  @override
  State<SelectContactUi> createState() => _SelectContactUiState();
}

class _SelectContactUiState extends State<SelectContactUi> {


  Widget buildText(String text, Function () onpress){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GestureDetector(
        onTap: onpress,
        child: Text(
          text,
          style: TextStyle(color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w500,),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: ListView(
        children: [
        Container(
        height: 70,
        width: double.infinity,
        color: SColors.color12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(SSvgs.sv07,),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Text('Select Contact', style: TextStyle(color: SColors.color13, fontSize: 12, fontWeight: FontWeight.w800,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: PopupMenuButton<String>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  CustomPopupMenuItem(value: 'invite_friend', text: 'Invite Friend',),
                  CustomPopupMenuItem(value: 'contacts', text: 'Contacts',),
                  CustomPopupMenuItem(value: 'refresh', text: 'Refresh',),
                  CustomPopupMenuItem(value: 'help', text: 'Help',),
                ],
                onSelected: (String choice) {
                  switch(choice) {
                    case 'invite_friend':break;
                    case 'contacts':break;
                    case 'refresh':break;
                    case 'help':break;
                  }
                },
                icon: SvgPicture.asset(SSvgs.sv08, width: 30, height: 30,),
                color: SColors.color11,
              ),
            ),

          ],
        ),
      ),
          const SearchTextField(),
          const SizedBox(height: 15,),
          buildText('NEW GROUP',(){}),
          const SizedBox(height: 15,),
          buildText('NEW CONTACT',(){}),
          const SizedBox(height: 40),
          const CTTile(labelText: 'RAJMOHAN CHOZHIATH'),
          const SizedBox(height: 15),
          const CTTile( labelText:'DULQUER SALMAN'),
          const SizedBox(height: 15),
          const CTTile( labelText:'ROY MATHEW'),
          const SizedBox(height: 15),
          const CTTile( labelText: 'OSAMA ABUHMEIDAN'),
          const SizedBox(height: 15),
         const CTTile(labelText:'AMITHAB BACHCHAN'),
        ],
      ),
      //bottomSheet: _buildBottomSheet(),
    );
  }
}

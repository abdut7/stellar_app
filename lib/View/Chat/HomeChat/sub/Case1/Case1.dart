import 'package:base_project/View/Chat/NewChat/NewChatUi.dart';
import 'package:base_project/View/Contact/AddContact/AddContactUi.dart';
import 'package:base_project/View/MoneyPayment/MoneyPaymentUi.dart';
import 'package:base_project/View/QRScan/Scanning/ScanningUi.dart';
import 'package:base_project/View/QRScan/TakeScan/TakeScanUi.dart';
import 'package:base_project/widgets/custom_popup_menu_item.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:base_project/widgets/welcome_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/widgets/home_chat_listtile.dart';

class Case1 extends StatefulWidget {
  const Case1({Key? key}) : super(key: key);

  @override
  State<Case1> createState() => _Case1State();
}

class _Case1State extends State<Case1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(backgroundColor: SColors.color12, toolbarHeight: 0, elevation: 0,),
      body: ListView(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: SColors.color12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset(SSvgs.sv07,),
                ),
                InkWell(
                  onTap: () {},
                  child: PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      CustomPopupMenuItem(
                        value: 'new_chat',
                        icon: SvgPicture.asset(SSvgs.sv17, width: 20, height: 20,),
                        text: 'New Chat',
                      ),
                      CustomPopupMenuItem(
                        value: 'add_contact',
                        icon: SvgPicture.asset(SSvgs.sv14, width: 20, height: 20,),
                        text: 'Add Contact',
                      ),
                      CustomPopupMenuItem(
                        value: 'scan',
                        icon: SvgPicture.asset(SSvgs.sv16, width: 20, height: 20,),
                        text: 'Scan',
                      ),
                      CustomPopupMenuItem(
                        value: 'money',
                        icon: SvgPicture.asset(SSvgs.sv15, width: 20, height: 20,),
                        text: 'Money',
                      ),
                    ],
                    onSelected: (String choice) {
                      switch(choice) {
                        case 'new_chat':
                          Navigator.pushNamed(context, NewChatUi.routeName);
                          break;
                        case 'add_contact':
                          Navigator.pushNamed(context, AddContactUi.routeName);
                          break;
                        case 'scan':
                          Navigator.pushNamed(context, TakeScanUi.routeName);
                          break;
                        case 'money':
                          Navigator.pushNamed(context, MoneyPaymentUi.routeName);
                          break;
                      }
                    },
                    icon: SvgPicture.asset(SSvgs.sv08, width: 30, height: 30,),
                    color: SColors.color11,
                  ),
                ),],),),

          const SizedBox(height: 25),
          const SearchTextField(),
          const SizedBox(height: 25),
          WelcomeChatContainer(),
          const SizedBox(height: 25),
          const HomeChatListTile(
            showDoubleTick: false,
            title1: 'Rajmohan Chozhiath',
            title2: '06:21 PM',
            subtitle1: 'Okay, i’ll work on it when it’s...',
            subtitle2: '4',
          ),
          const HomeChatListTile(
            showDoubleTick: true,
            title1: 'Roy Mathew',
            title2: 'Yesterday',
            subtitle1: 'Okay, it’s all noted',
            subtitle2: '',
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration:  BoxDecoration(shape: BoxShape.circle, color: SColors.color13),
        child: IconButton(
          icon: const Icon(Icons.message, color: Colors.white, size: 40,),
          onPressed: () {},
        ),
      ),
    );
  }
}




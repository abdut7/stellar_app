import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/services/api_services/chat_history_service.dart';
import 'package:stellar_chat/services/api_services/group_service.dart';
import 'package:stellar_chat/view/chat/group_chat/group_info/widgets/group_description_textfield.dart';

class ChangeGroupNameScreen extends StatefulWidget {
  final String chatId;
  final String name;
  const ChangeGroupNameScreen(
      {super.key, required this.chatId, required this.name});

  @override
  State<ChangeGroupNameScreen> createState() => _ChangeGroupNameScreenState();
}

class _ChangeGroupNameScreenState extends State<ChangeGroupNameScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.name;
    super.initState();
  }

  bool isUpdating = false;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return Scaffold(
        backgroundColor: themeController.isDarkTheme.value
            ? SColors.darkmode
            : SColors.color4,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          title: Text(
            'Enter Group\nName',
            style: TextStyle(
              color: themeController.isDarkTheme.value
                  ? SColors.appbarTitleInDark
                  : SColors.color11,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: themeController.isDarkTheme.value
              ? SColors.appbarbgInDark
              : SColors.color12,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(SSvgs.appLogo),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          GroupDescTextfield(
            keyboardType: TextInputType.name,
            maxLines: 1,
            head: '',
            controller: nameController,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              thickness: 1.2,
              color: themeController.isDarkTheme.value
                  ? SColors.color26
                  : SColors.color3,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                isUpdating = true;
              });
              //update group description here
              await GroupServices.updateName(
                  name: nameController.text, chatID: widget.chatId);
              await ChatHistoryServiceApi.getChatHistory();
              setState(() {
                isUpdating = false;
              });
              Get.back();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              decoration: BoxDecoration(
                color: themeController.isDarkTheme.value
                    ? SColors.color26
                    : SColors.color12,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  isUpdating ? "Updating..." : 'Update',
                  style: TextStyle(
                      fontSize: 14,
                      color: themeController.isDarkTheme.value
                          ? SColors.color4
                          : SColors.color11),
                ),
              ),
            ),
          )
        ]));
  }
}

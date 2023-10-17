import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

import '../../../../models/api_models/get_contacts_model.dart';

class AddUserGroupTileWidget extends StatelessWidget {
  final bool isSelcted;
  const AddUserGroupTileWidget({
    super.key,
    required this.user,
    required this.isSelcted,
  });

  final Contact user;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
      Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 6,
            backgroundColor: isSelcted ? SColors.color12 : Colors.grey.withOpacity(0.4),
          ),
          const SizedBox(
            width: 15,
          ),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: user.strProfileUrl.isEmpty ? const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                ),
              )
                  : DecorationImage(fit: BoxFit.cover, image: NetworkImage(user.strProfileUrl),
              ),
            ),
          ),

          const SizedBox(width: 15,),
          Text(user.strFullName,
          style: TextStyle(
            color: themeController.isDarkTheme.value
                ?  SColors.color4
                : SColors.color3,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),),
        ],
      ),
    );
  }
}

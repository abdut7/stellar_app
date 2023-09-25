import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/Profile/qr/qr_screen.dart';
import 'package:base_project/View/Profile/widget/tile.dart';
import 'package:base_project/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: SColors.color4,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        controller.userDetailsModel.value!.strProfileUrl, fit: BoxFit.cover, width: Get.width , height: Get.width ,),
                      Positioned(
                        top: 250,
                        left: 20,
                        child: Text(
                          controller.userDetailsModel.value!.strName,
                          style: TextStyle(color: SColors.color11, fontSize: 15, fontWeight: FontWeight.w800,),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        left: 20,
                        child: Text(
                          'Online',
                          style: TextStyle(color: SColors.color11, fontSize: 13, fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 285,
                  right: 60,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.add_a_photo_outlined, color: SColors.color9, size: 30,),),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const QRScreen());
                    },
                    child: Icon(Icons.qr_code, color: SColors.color4, size: 30,),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomListTilee(
                text: 'Favorites',
                onTap: () {},
                svgAsset: SSvgs.sv25,
                trailingIcon: Icons.arrow_forward_ios),
            CustomListTilee(
                text: 'Flicks',
                onTap: () {},
                svgAsset: SSvgs.sv26,
                trailingIcon: Icons.arrow_forward_ios),
            CustomListTilee(
                text: 'Sticker Gallery',
                onTap: () {},
                svgAsset: SSvgs.sv27,
                trailingIcon: Icons.arrow_forward_ios),
            Column(
              children: [
                CustomListTilee(
                    text: 'Channel',
                    onTap: () {},
                    svgAsset: SSvgs.channelLogo,
                    trailingIcon: Icons.arrow_forward_ios),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Divider(
                    color: SColors.color3,
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Delete My Account',
                      style: TextStyle(color: SColors.color11, fontSize: 15, fontWeight: FontWeight.w600,)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(color: SColors.color17, fontSize: 16, fontWeight: FontWeight.w500,),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Blocked User',
                        style: TextStyle(color: SColors.color3, fontSize: 15, fontWeight: FontWeight.w400,),
                      ),
                      Text(
                        '22', style: TextStyle(color: SColors.color11, fontSize: 10, fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

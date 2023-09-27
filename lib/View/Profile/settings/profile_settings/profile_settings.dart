import 'package:flutter/material.dart';
import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/Profile/qr/qr_screen.dart';
import 'package:base_project/View/Profile/widget/tile.dart';
import 'package:base_project/controllers/user_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
                        child: Text('Online', style: TextStyle(color: SColors.color11, fontSize: 13, fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 280,
                  right: 60,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {}, child: SvgPicture.asset(SSvgs.editIcon)),
                ),
                Positioned(
                  top: 10, right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const QRScreen());
                    },
                    child: Icon(Icons.qr_code, color: SColors.color4, size: 30,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            CustomListTilee(
                text: 'Favorites',
                onTap: () {},
                svgAsset: SSvgs.sv25,
                trailingIcon: Icons.arrow_forward_ios,),
            Column(
              children: [
                CustomListTilee(
                    text: 'Sticker Gallery',
                    onTap: () {},
                    svgAsset: SSvgs.sv27,
                    trailingIcon: Icons.arrow_forward_ios),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Divider(
                    color: SColors.color3,
                    thickness: 1,
                    height: 1,
                  ),),],),
            const SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                        'Settings',
                        style: TextStyle(color: SColors.color11, fontSize: 18, fontWeight: FontWeight.w600,)),
                  ),
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'Privacy and Security', style: TextStyle(color: SColors.color3, fontSize: 16, fontWeight: FontWeight.w400,),),)
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dark Mode', style: TextStyle(color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w400,),),
                      IgnorePointer(
                        ignoring: true,
                        child: Switch(value: false, onChanged: (bool newValue) {}, activeColor: SColors.color11,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                            'Help ', style: TextStyle(color: SColors.color11, fontSize: 18, fontWeight: FontWeight.w600,)),),),
                    const SizedBox(height: 10,),
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Text(
                            'Ask A Question', style: TextStyle(color: SColors.color3, fontSize: 16, fontWeight: FontWeight.w400,),),),
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Text('Stellar Chat FAQ', style: TextStyle(color: SColors.color3, fontSize: 16, fontWeight: FontWeight.w400,),),),
                    ),]),],)],
        ),
      ),
    );
  }
}
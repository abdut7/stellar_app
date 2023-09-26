import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/Profile/widget/custom_grid_view.dart';
import 'package:base_project/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  height: 250,
                  child: Stack(
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                            stops: [0.0, 0.5],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child:
                        Image.network(
                          controller.userDetailsModel.value!.strProfileUrl,
                          fit: BoxFit.fill,
                          width: Get.width,
                          height: Get.width,
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 180,
                        child: Text(
                          controller.userDetailsModel.value!.strName,
                          style: TextStyle(
                            color: SColors.color3,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 180,
                        child: Text(
                          'Online',
                          style: TextStyle(
                            color: SColors.color3,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: (){},
                      child: SvgPicture.asset(SSvgs.sv29)),
                ),],),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:Row(
                children: [
                  customProfileStats('09', 'Posts'),
                  customProfileStats('23', 'Following'),
                  customProfileStats('293', 'Followers'),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              width: Get.width * 0.5,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 51, 142, 1),
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(159, 196, 232, 1)),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            customDescriptionWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(color: SColors.color9,thickness: 1,),
            ),
            CustomGridView(),
          ]
      ),
      )
    );
  }
}

Widget customProfileStats(String count, String label) {
  return Expanded(
    child: Column(
      children: [
        Text(
          count,
          style:  TextStyle(color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w600,),),
        Text(
          label,
          style: TextStyle(color: SColors.color3, fontSize: 11, fontWeight: FontWeight.w400,),
        ),
      ],
    ),
  );
}
Widget customDescriptionWidget() {
  return  Padding(
    padding:  const EdgeInsets.symmetric(horizontal: 30),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Description\n',
            style: TextStyle(
              color: SColors.color3, fontSize: 12, fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'The availability of low-cost flights and last minute internet deals means that cheap holidays are far easier to come by than they used to be, but it can still take a bit of shopping around to get the best discounts.',
            style: TextStyle(
              color: SColors.color3, fontSize: 11, fontWeight: FontWeight.w400,),
          ),
        ],
      ),
    ),
  );
}


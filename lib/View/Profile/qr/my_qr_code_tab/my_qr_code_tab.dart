import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/user_controller.dart';

class MyQRCodeTab extends StatefulWidget {
  final UserController controller;

  const MyQRCodeTab({super.key, required this.controller});
  @override
  _MyQRCodeTabState createState() => _MyQRCodeTabState();
}

class _MyQRCodeTabState extends State<MyQRCodeTab> {
  final double circleRadius = 100.0;

  @override
  Widget build(BuildContext context) {
    print(controller.userDetailsModel.value!.strQRCodeUrls);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: circleRadius / 2.0),
                  child: Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 2.0),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: circleRadius / 2),
                          Text(
                            controller.userDetailsModel.value!.strName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: SColors.color3,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Stellar Chat Contact',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: SColors.color3,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: Get.width * 0.5,
                            height: Get.width * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(controller
                                    .userDetailsModel.value!.strQRCodeUrls),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                ///Profile Avatar
                Container(
                  width: circleRadius + 8,
                  height: circleRadius + 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: SColors.color4,
                      width: 10.0,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SSvgs.sv06,
                      fit: BoxFit.cover,
                      width: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 325, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your QR code is private,"
                  " If you share it with someone,"
                  " they can scan it with their Stellar camera to add "
                  "you as a contact.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

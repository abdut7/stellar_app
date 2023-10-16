import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/controllers/bottom_navigation_controller.dart';
import 'package:stellar_chat/controllers/contacts_controller.dart';
import 'package:stellar_chat/stellar_pay/screens/stellar_pay_home/money_pay_home.dart';

class StellarPaySplashScreen extends StatefulWidget {
  const StellarPaySplashScreen({Key? key}) : super(key: key);

  @override
  State<StellarPaySplashScreen> createState() => _StellarPaySplashScreenState();
}

class _StellarPaySplashScreenState extends State<StellarPaySplashScreen> {
  ContactsController contactsController = Get.put(ContactsController());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color12,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xFF75C681),
                Color.fromRGBO(25, 171, 51, 1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              image: DecorationImage(
                image: AssetImage(SImages.image1),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image.asset(
                SImages.vectorBackground,
                fit: BoxFit.cover,
                color: SColors.color20.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.4),
                child: Center(
                  child: SvgPicture.asset(
                    SSvgs.stellarSplashLogo,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 70),
                child: Text(
                  'Stellar Pay, a fast and easy way to\nsend or request money using just the phone\n number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(()=>const MoneyPayHome());
                  BottomNavigationController controller = Get.find();
                  controller.bottomNavList[1].add(const MoneyPayHome());
                  // controller.pageCount(2);
                  // controller.pageCount(1);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.62,
                  height: 43,
                  decoration: BoxDecoration(
                    color: SColors.color20,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 17,
                          color: SColors.color19,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/token_service/token_service.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   authenticateUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color12,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(SImages.vectorBackground), fit: BoxFit.fill,),),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(SSvgs.appLogoAndName,),],
              ),
            ),
            const Positioned(
              bottom: 16, left: 0, right: 0,
              child: Center(
                child: Text('Welcome to Stellar App', style: TextStyle(fontSize: 13,
                    color: Colors.white38, fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../helpers/sp_helper.dart';
import '../../../../utils/sp_keys.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';

  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      String? token = await SpHelper.getString(keyToken);

      //Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Placeholder());
  }
}

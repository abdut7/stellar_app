import 'package:flutter/material.dart';

import '../../services/token_service/token_service.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  const SplashScreen({super.key});

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
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}

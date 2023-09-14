import 'package:base_project/View/Chat/chat_screen/chat_screen.dart';
import 'package:base_project/View/LoginPages/WelcomePage/WelcomePageUi.dart';
import 'package:base_project/View/base_bottom_nav/bottom_nav.dart';
import 'package:base_project/View/splash/spalash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return GetMaterialApp(
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//
//
//
//
// import 'package:base_project/View/Chat/CreateNewChat/CreateNewChatUi.dart';
// import 'package:base_project/View/Chat/HomeChat/HomeChatUi.dart';
// import 'package:base_project/View/Chat/NewChat/NewChatUi.dart';
// import 'package:base_project/View/Contact/AddContact/AddContactUi.dart';
// import 'package:base_project/View/LoginPages/LoginWithMobile/LoginWithMobileUi.dart';
// import 'package:base_project/View/LoginPages/OtpVerification/OtpVerificationUi.dart';
// import 'package:base_project/View/LoginPages/SignUpOptions/SignUpOptionsUi.dart';
// import 'package:base_project/View/LoginPages/SignUpWithMobile/SignUpWithMobileUi.dart';
// import 'package:base_project/View/LoginPages/WelcomePage/WelcomePageUi.dart';
// import 'package:base_project/View/MoneyPayment/MoneyPaymentUi.dart';
// import 'package:base_project/View/QRScan/Scanning/ScanningUi.dart';
// import 'package:base_project/View/QRScan/TakeScan/TakeScanUi.dart';
// import 'package:base_project/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       theme: ThemeData(
//         textTheme: GoogleFonts.interTextTheme(
//           Theme.of(context).textTheme,
//         ),
//         //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
//         //useMaterial3: true,
//       ),
//       home: NewChatUi(),
//     );
//   }
// }

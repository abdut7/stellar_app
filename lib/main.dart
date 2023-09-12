import 'package:base_project/View/LoginPages/WelcomePage/WelcomePageUi.dart';
import 'package:base_project/features/setup/login/view/login_screen.dart';
import 'package:base_project/providers/auth_providers/sign_up_provider.dart';
import 'package:base_project/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/setup/splashscreen/view/splashscreen.dart';
import 'providers/language_provider.dart';
import 'utils/interceptors.dart';
import 'utils/localization.dart';
import 'utils/routes.dart';
import 'utils/themes.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Project Name',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ja', ''),
          ],
          theme: appLightTheme,
          locale: context.watch<LanguageProvider>().locale,
          //initialRoute: LoginScreen.routeName,
          initialRoute: WelcomePageUi.routeName,

          // initialRoute: SplashScreen.routeName,
          onGenerateRoute: onAppGenerateRoute(),
          routes: appRoutes(),
          builder: (context, child) {
            LanguageProvider.initContext(context);
            Localization.init(context);

            // if (kDebugMode) {
            //   StackTrace.current.toString().log('', true);
            //   child = AppStackInterceptorBuilder(child: child!);
            // }
            return child!;
          },
        ),
      ),
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

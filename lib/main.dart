import 'package:base_project/View/LoginPages/WelcomePage/WelcomePageUi.dart';
import 'package:base_project/features/setup/login/view/login_screen.dart';
import 'package:base_project/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => MaterialApp(
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





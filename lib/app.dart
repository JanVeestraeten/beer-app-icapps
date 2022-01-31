import 'package:beer_app_icapps/base/colors/colors.dart';
import 'package:beer_app_icapps/base/custom_page_transition.dart';
import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:beer_app_icapps/screens/overview/overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base/platform_widgets/platform_widgets.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set portrait orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  final int index = 0;

  final materialTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.blue,
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CustomAndroidTransitionsBuilder(),
    }),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.blue,
      secondary: AppColors.blue,
    ),
  );

  final cupertinoTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
  );

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'beer-app-icapps',
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      themeMode: ThemeMode.light,
      home: const OverviewScreen(),
      supportedLocales: S.delegate.supportedLocales,
      globalNavKey: navigatorKey,
      routes: const {},
    );
  }
}

import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:flutter/scheduler.dart';

import 'platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  final ThemeData materialTheme;
  final CupertinoThemeData cupertinoTheme;
  final Widget? home;
  final String title;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState> globalNavKey;
  final Locale? locale;
  final dynamic builder;
  final String initialRoute;
  final ThemeMode themeMode;
  final Map<String, Widget Function(BuildContext)> routes;

  PlatformApp({
    required this.globalNavKey,
    required this.materialTheme,
    required this.cupertinoTheme,
    this.home,
    required this.title,
    required this.supportedLocales,
    this.locale,
    this.builder,
    this.initialRoute = '/',
    required this.routes,
    this.themeMode = ThemeMode.system,
  });

  @override
  CupertinoApp createCupertinoWidget(BuildContext context) => CupertinoApp(
        title: title,
        theme: themeMode.index == 0
            ? cupertinoTheme.copyWith(
                brightness:
                    SchedulerBinding.instance!.window.platformBrightness)
            : themeMode.index == 1
                ? cupertinoTheme.copyWith(brightness: Brightness.light)
                : cupertinoTheme.copyWith(brightness: Brightness.dark),
        navigatorKey: globalNavKey,
        home: home,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: locale,
        builder: builder != null ? builder : null,
        supportedLocales: supportedLocales,
        initialRoute: initialRoute,
        routes: routes,
      );

  @override
  MaterialApp createMaterialWidget(BuildContext context) => MaterialApp(
        title: title,
        theme: materialTheme,
        home: home,
        navigatorKey: globalNavKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        locale: locale,
        themeMode: themeMode,
        builder: builder != null ? builder : null,
        supportedLocales: supportedLocales,
        initialRoute: initialRoute,
        routes: routes,
      );
}

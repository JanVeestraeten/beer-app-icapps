// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Beer App Icapps`
  String get app_name {
    return Intl.message(
      'Beer App Icapps',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again later.`
  String get network_error_something_went_wrong {
    return Intl.message(
      'Something went wrong, please try again later.',
      name: 'network_error_something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get network_error_no_internet_connection {
    return Intl.message(
      'Check your internet connection.',
      name: 'network_error_no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `U are not authenticated`
  String get network_error_no_authentication {
    return Intl.message(
      'U are not authenticated',
      name: 'network_error_no_authentication',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get error_default {
    return Intl.message(
      'Something went wrong',
      name: 'error_default',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get network_error {
    return Intl.message(
      'Check your internet connection.',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong with authenticating the app, please try again later.`
  String get login_error {
    return Intl.message(
      'Something went wrong with authenticating the app, please try again later.',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

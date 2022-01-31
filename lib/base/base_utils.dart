import 'dart:io';

import 'dart:core';

import 'package:beer_app_icapps/base/secure_storage.dart';
import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:beer_app_icapps/networking/do_call.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print("could not launch: ${command.toString()}");

    if (Platform.isIOS) {
      showAlertDialog(
          title: S.current.app_name,
          message: S.current.network_error_something_went_wrong);
    } else {
      showSnackBar(message: S.current.network_error_something_went_wrong);
    }
  }
}

clearSecureStorageOnReinstall() async {
  String key = 'firstRun';
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getBool(key) ?? true) {
    await SecureStorage.deleteAll();
    prefs.setBool(key, false);
  } else {}
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension ListExtensions<T> on List<T> {
  bool containsAt(T value, int index) {
    return index >= 0 && length > index && this[index] == value;
  }
}

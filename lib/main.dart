import 'package:beer_app_icapps/app.dart';
import 'package:beer_app_icapps/base/base_utils.dart';
import 'package:beer_app_icapps/base/get_it.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerSingletons();

  await clearSecureStorageOnReinstall();

  runApp(App());
}

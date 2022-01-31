library globals;

import 'package:beer_app_icapps/base/get_it.dart';
import 'package:beer_app_icapps/base/secure_storage.dart';
import 'package:beer_app_icapps/database/database.dart';

// late AppDatabase database;

String baseUrl = "https://icapps-nodejs-beers-api.herokuapp.com/api/v1/";

logout() async {
  //delete db
  await getIt.get<AppDatabase>().deleteDatabase();

  //delete secureStorage
  await SecureStorage.deleteAll();

  // navigatorKey.currentState
  //     ?.pushAndRemoveUntil(PlatformRoute(route: SplashScreen()), (_) => false);
}

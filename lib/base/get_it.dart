import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/database/database_helper.dart';
import 'package:beer_app_icapps/services/network_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

registerSingletons() async {
  getIt.registerSingleton<NetworkService>(NetworkService());
  AppDatabase db = await initDatabase();
  getIt.registerSingleton<AppDatabase>(db);
}

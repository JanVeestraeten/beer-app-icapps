import 'package:beer_app_icapps/base/get_it.dart';
import 'package:beer_app_icapps/database/dao/all_daos.dart';
import 'package:beer_app_icapps/database/tables/all_tables.dart';
import 'package:beer_app_icapps/models/web/brewery.dart';
import 'type_converters.dart';
import 'package:drift/drift.dart';

part 'database.drift.dart';

// ! flutter pub run build_runner watch --delete-conflicting-outputs

@DriftDatabase(tables: [Beers], daos: [BeerDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase.connect(DatabaseConnection connection)
      : super.connect(connection);

  @override
  int get schemaVersion => 1;

  deleteDatabase() async {
    await transaction(() async {
      // Deleting tables in reverse topological order to avoid foreign-key conflicts
      final tables = getIt.get<AppDatabase>().allTables.toList().reversed;

      for (final table in tables) {
        await delete(table).go();
      }
    });
  }
}

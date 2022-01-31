import 'package:beer_app_icapps/database/type_converters.dart';
import 'package:drift/drift.dart';

class Beers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get rating => integer().nullable()();
  TextColumn get thumbImageUrl => text()();
  TextColumn get imageUrl => text()();
  TextColumn get brewery => text().map(BreweryConverter())();

  @override
  Set<Column>? get primaryKey => {id};
}

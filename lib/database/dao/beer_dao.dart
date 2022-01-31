import 'dart:convert';

import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/database/tables/beers_table.dart';
import 'package:beer_app_icapps/models/web/beer.dart';
import 'package:drift/drift.dart';

part 'beer_dao.drift.dart';

@DriftAccessor(tables: [
  Beers,
])
class BeerDao extends DatabaseAccessor<AppDatabase> with _$BeerDaoMixin {
  BeerDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  insertBeers({required List<BeerWeb> newBeers}) async {
    List<Beer> list = newBeers
        .map((beer) => Beer(
            id: beer.id!,
            name: beer.name!,
            thumbImageUrl: beer.thumbImageUrl!,
            imageUrl: beer.imageUrl!,
            brewery: beer.brewery!,
            rating: beer.rating != null ? beer.rating! : null))
        .toList();

    await batch((batch) => batch.insertAllOnConflictUpdate(beers, list));
  }

  Stream<Beer> getBeerStreamWithID({required String id}) =>
      (select(beers)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Stream<List<Beer>> getBeersStream() => select(beers).watch();

  Future<List<Beer>> getBeers() async => await select(beers).get();

  Stream<List<Beer>> getRatedBeersStream() =>
      (select(beers)..where((tbl) => tbl.rating.isNotNull())).watch();

  Future<void> updateBeerRating(
          {required String id, required int rating}) async =>
      await (update(beers)..where((tbl) => tbl.id.equals(id)))
          .write(BeersCompanion(rating: Value(rating)));

  Future<void> breweriesWithBeers() async {
    // await (select(beers)..where((tbl) => tbl.))
  }
}

import 'package:beer_app_icapps/base/get_it.dart';
import 'package:beer_app_icapps/database/dao/all_daos.dart';
import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/models/web/beer_repository.dart';
import 'package:beer_app_icapps/models/web/beers_response.dart';
import 'package:beer_app_icapps/networking/do_call.dart';
import 'package:beer_app_icapps/services/network_service.dart';

class BeerRepository {
  static final protectedClient = getIt.get<NetworkService>().protectedService;
  static final dao = BeerDao(getIt.get<AppDatabase>());

  static Future<void> getBeers() async {
    // List<Beer> beers = <Beer>[];
    await doCall<BeersResponse>(protectedClient.getBeers(),
        succesFunction: (beersResponse) async {
      //insert beers in db
      if (beersResponse.data != null) {
        await dao.insertBeers(newBeers: beersResponse.data!);
      }
      return beersResponse.data;
    });
  }

  static Future<void> getBeerDetail({required String id}) async {
    // List<Beer> beers = <Beer>[];

    await doCall<BeerResponse>(protectedClient.getBeerDetail(id: id),
        succesFunction: (beerResponse) async {
      if (beerResponse.data != null) {
        await dao.insertBeers(newBeers: [beerResponse.data!]);
      }
      return beerResponse.data;
    });
  }

  static Future<void> rateBeer(
      {required String id, required int newRating}) async {
    await doCall<BeerResponse>(
        protectedClient.rateBeer(id: id, rating: newRating),
        succesFunction: (beerResponse) async {
      await BeerRepository.dao.updateBeerRating(
          id: beerResponse.data!.id!, rating: beerResponse.data!.rating!);
    });
  }
}

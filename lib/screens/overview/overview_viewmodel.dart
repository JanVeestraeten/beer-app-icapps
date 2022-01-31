import 'package:beer_app_icapps/base/secure_storage.dart';
import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/repositories/auth_repository.dart';
import 'package:beer_app_icapps/repositories/beer_repository.dart';
import 'package:mobx/mobx.dart';

part 'overview_viewmodel.g.dart';

class OverviewViewModel extends _OverviewViewModel with _$OverviewViewModel {}

abstract class _OverviewViewModel with Store {
  @observable
  dynamic token = "";

  @observable
  bool isList = true;

  @observable
  ObservableStream<List<Beer>> beers =
      BeerRepository.dao.getBeersStream().asObservable();

  @observable
  ObservableStream<List<Beer>> ratedBeers =
      BeerRepository.dao.getRatedBeersStream().asObservable();

  _OverviewViewModel() {
    init();
  }

  Future<void> init() async {
    String? accessToken =
        await SecureStorage.readSecureData(SecureStorage.ACCESS_TOKEN);

    if (accessToken != null) {
      await getBeers();
    } else {
      await getToken();
      await getBeers();
    }
  }

  Future<void> getToken() async {
    await AuthRepository.getToken(
      username: "star_developer@icapps.com",
      password: "developer",
    );
  }

  Future<void> getBeers() async {
    await BeerRepository.getBeers();
  }
}

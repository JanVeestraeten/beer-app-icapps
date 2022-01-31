import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/repositories/beer_repository.dart';
import 'package:mobx/mobx.dart';

part 'beer_detail_viewmodel.g.dart';

class BeerDetailViewModel extends _BeerDetailViewModel
    with _$BeerDetailViewModel {
  BeerDetailViewModel({required String id}) : super(id: id);
}

abstract class _BeerDetailViewModel with Store {
  @observable
  ObservableStream<Beer> beerStream = const Stream<Beer>.empty().asObservable();

  @observable
  double newRating = 0.0;

  @computed
  double? get currentRating => beerStream.value?.rating?.toDouble();

  _BeerDetailViewModel({required String id}) {
    beerStream = BeerRepository.dao.getBeerStreamWithID(id: id).asObservable();
    getDetails(id: id);
  }

  Future<void> getDetails({required String id}) async {
    await BeerRepository.getBeerDetail(id: id);
  }

  Future<void> rateBeer({required String id}) async {
    await BeerRepository.rateBeer(id: id, newRating: newRating.toInt());
  }
}

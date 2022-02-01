// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_detail_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BeerDetailViewModel on _BeerDetailViewModel, Store {
  Computed<double?>? _$currentRatingComputed;

  @override
  double? get currentRating =>
      (_$currentRatingComputed ??= Computed<double?>(() => super.currentRating,
              name: '_BeerDetailViewModel.currentRating'))
          .value;

  final _$beerStreamAtom = Atom(name: '_BeerDetailViewModel.beerStream');

  @override
  ObservableStream<Beer> get beerStream {
    _$beerStreamAtom.reportRead();
    return super.beerStream;
  }

  @override
  set beerStream(ObservableStream<Beer> value) {
    _$beerStreamAtom.reportWrite(value, super.beerStream, () {
      super.beerStream = value;
    });
  }

  final _$newRatingAtom = Atom(name: '_BeerDetailViewModel.newRating');

  @override
  double get newRating {
    _$newRatingAtom.reportRead();
    return super.newRating;
  }

  @override
  set newRating(double value) {
    _$newRatingAtom.reportWrite(value, super.newRating, () {
      super.newRating = value;
    });
  }

  @override
  String toString() {
    return '''
beerStream: ${beerStream},
newRating: ${newRating},
currentRating: ${currentRating}
    ''';
  }
}

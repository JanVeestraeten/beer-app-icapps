// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OverviewViewModel on _OverviewViewModel, Store {
  final _$tokenAtom = Atom(name: '_OverviewViewModel.token');

  @override
  dynamic get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(dynamic value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$isListAtom = Atom(name: '_OverviewViewModel.isList');

  @override
  bool get isList {
    _$isListAtom.reportRead();
    return super.isList;
  }

  @override
  set isList(bool value) {
    _$isListAtom.reportWrite(value, super.isList, () {
      super.isList = value;
    });
  }

  final _$beersAtom = Atom(name: '_OverviewViewModel.beers');

  @override
  ObservableStream<List<Beer>> get beers {
    _$beersAtom.reportRead();
    return super.beers;
  }

  @override
  set beers(ObservableStream<List<Beer>> value) {
    _$beersAtom.reportWrite(value, super.beers, () {
      super.beers = value;
    });
  }

  final _$ratedBeersAtom = Atom(name: '_OverviewViewModel.ratedBeers');

  @override
  ObservableStream<List<Beer>> get ratedBeers {
    _$ratedBeersAtom.reportRead();
    return super.ratedBeers;
  }

  @override
  set ratedBeers(ObservableStream<List<Beer>> value) {
    _$ratedBeersAtom.reportWrite(value, super.ratedBeers, () {
      super.ratedBeers = value;
    });
  }

  @override
  String toString() {
    return '''
token: ${token},
isList: ${isList},
beers: ${beers},
ratedBeers: ${ratedBeers}
    ''';
  }
}

import 'dart:convert';
import 'package:beer_app_icapps/models/web/brewery.dart';
import 'package:drift/drift.dart';

//* StringList Converter
class DateTimeConverter extends TypeConverter<DateTime, String> {
  @override
  DateTime? mapToDart(String? fromDb) {
    if (fromDb == null) return null;

    return DateTime.parse(fromDb);
  }

  @override
  String? mapToSql(DateTime? value) {
    if (value == null) return null;

    return value.toIso8601String();
  }
}

//* StringList Converter
class BreweryConverter extends TypeConverter<Brewery?, String> {
  @override
  Brewery? mapToDart(String? fromDb) {
    if (fromDb == null) return null;

    return Brewery.fromJson(json.decode(fromDb));
  }

  @override
  String? mapToSql(Brewery? value) {
    if (value == null) return null;

    return json.encode(value);
  }
}

//* StringList Converter
class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    } else {
      List<String> stringList = [];
      List<dynamic> list = json.decode(fromDb);

      stringList = list.cast<String>();

      return stringList;
    }
  }

  @override
  String? mapToSql(List<String>? value) {
    if (value == null) {
      return null;
    } else {
      return json.encode(value);
    }
  }
}

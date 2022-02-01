// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Beer extends DataClass implements Insertable<Beer> {
  final String id;
  final String name;
  final int? rating;
  final String thumbImageUrl;
  final String imageUrl;
  final Brewery? brewery;
  Beer(
      {required this.id,
      required this.name,
      this.rating,
      required this.thumbImageUrl,
      required this.imageUrl,
      required this.brewery});
  factory Beer.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Beer(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      rating: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      thumbImageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumb_image_url'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
      brewery: $BeersTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}brewery']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int?>(rating);
    }
    map['thumb_image_url'] = Variable<String>(thumbImageUrl);
    map['image_url'] = Variable<String>(imageUrl);
    {
      final converter = $BeersTable.$converter0;
      map['brewery'] = Variable<String>(converter.mapToSql(brewery)!);
    }
    return map;
  }

  BeersCompanion toCompanion(bool nullToAbsent) {
    return BeersCompanion(
      id: Value(id),
      name: Value(name),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      thumbImageUrl: Value(thumbImageUrl),
      imageUrl: Value(imageUrl),
      brewery: Value(brewery),
    );
  }

  factory Beer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Beer(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      rating: serializer.fromJson<int?>(json['rating']),
      thumbImageUrl: serializer.fromJson<String>(json['thumbImageUrl']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      brewery: serializer.fromJson<Brewery?>(json['brewery']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'rating': serializer.toJson<int?>(rating),
      'thumbImageUrl': serializer.toJson<String>(thumbImageUrl),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'brewery': serializer.toJson<Brewery?>(brewery),
    };
  }

  Beer copyWith(
          {String? id,
          String? name,
          int? rating,
          String? thumbImageUrl,
          String? imageUrl,
          Brewery? brewery}) =>
      Beer(
        id: id ?? this.id,
        name: name ?? this.name,
        rating: rating ?? this.rating,
        thumbImageUrl: thumbImageUrl ?? this.thumbImageUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        brewery: brewery ?? this.brewery,
      );
  @override
  String toString() {
    return (StringBuffer('Beer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rating: $rating, ')
          ..write('thumbImageUrl: $thumbImageUrl, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('brewery: $brewery')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, rating, thumbImageUrl, imageUrl, brewery);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Beer &&
          other.id == this.id &&
          other.name == this.name &&
          other.rating == this.rating &&
          other.thumbImageUrl == this.thumbImageUrl &&
          other.imageUrl == this.imageUrl &&
          other.brewery == this.brewery);
}

class BeersCompanion extends UpdateCompanion<Beer> {
  final Value<String> id;
  final Value<String> name;
  final Value<int?> rating;
  final Value<String> thumbImageUrl;
  final Value<String> imageUrl;
  final Value<Brewery?> brewery;
  const BeersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rating = const Value.absent(),
    this.thumbImageUrl = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.brewery = const Value.absent(),
  });
  BeersCompanion.insert({
    required String id,
    required String name,
    this.rating = const Value.absent(),
    required String thumbImageUrl,
    required String imageUrl,
    required Brewery? brewery,
  })  : id = Value(id),
        name = Value(name),
        thumbImageUrl = Value(thumbImageUrl),
        imageUrl = Value(imageUrl),
        brewery = Value(brewery);
  static Insertable<Beer> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int?>? rating,
    Expression<String>? thumbImageUrl,
    Expression<String>? imageUrl,
    Expression<Brewery?>? brewery,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rating != null) 'rating': rating,
      if (thumbImageUrl != null) 'thumb_image_url': thumbImageUrl,
      if (imageUrl != null) 'image_url': imageUrl,
      if (brewery != null) 'brewery': brewery,
    });
  }

  BeersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int?>? rating,
      Value<String>? thumbImageUrl,
      Value<String>? imageUrl,
      Value<Brewery?>? brewery}) {
    return BeersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      thumbImageUrl: thumbImageUrl ?? this.thumbImageUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      brewery: brewery ?? this.brewery,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int?>(rating.value);
    }
    if (thumbImageUrl.present) {
      map['thumb_image_url'] = Variable<String>(thumbImageUrl.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (brewery.present) {
      final converter = $BeersTable.$converter0;
      map['brewery'] = Variable<String>(converter.mapToSql(brewery.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BeersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rating: $rating, ')
          ..write('thumbImageUrl: $thumbImageUrl, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('brewery: $brewery')
          ..write(')'))
        .toString();
  }
}

class $BeersTable extends Beers with TableInfo<$BeersTable, Beer> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BeersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  late final GeneratedColumn<int?> rating = GeneratedColumn<int?>(
      'rating', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _thumbImageUrlMeta =
      const VerificationMeta('thumbImageUrl');
  late final GeneratedColumn<String?> thumbImageUrl = GeneratedColumn<String?>(
      'thumb_image_url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _breweryMeta = const VerificationMeta('brewery');
  late final GeneratedColumnWithTypeConverter<Brewery?, String?> brewery =
      GeneratedColumn<String?>('brewery', aliasedName, false,
              typeName: 'TEXT', requiredDuringInsert: true)
          .withConverter<Brewery?>($BeersTable.$converter0);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, rating, thumbImageUrl, imageUrl, brewery];
  @override
  String get aliasedName => _alias ?? 'beers';
  @override
  String get actualTableName => 'beers';
  @override
  VerificationContext validateIntegrity(Insertable<Beer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('thumb_image_url')) {
      context.handle(
          _thumbImageUrlMeta,
          thumbImageUrl.isAcceptableOrUnknown(
              data['thumb_image_url']!, _thumbImageUrlMeta));
    } else if (isInserting) {
      context.missing(_thumbImageUrlMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    context.handle(_breweryMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Beer map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Beer.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BeersTable createAlias(String alias) {
    return $BeersTable(_db, alias);
  }

  static TypeConverter<Brewery?, String> $converter0 = BreweryConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $BeersTable beers = $BeersTable(this);
  late final BeerDao beerDao = BeerDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [beers];
}

import 'package:beer_app_icapps/models/web/beer.dart';

class BeersResponse {
  Meta? meta;
  List<BeerWeb>? data;

  BeersResponse({this.meta, this.data});

  BeersResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <BeerWeb>[];
      json['data'].forEach((v) {
        data!.add(BeerWeb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String? type;
  int? totalCount;
  int? count;

  Meta({this.type, this.totalCount, this.count});

  Meta.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    totalCount = json['totalCount'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['totalCount'] = totalCount;
    data['count'] = count;
    return data;
  }
}

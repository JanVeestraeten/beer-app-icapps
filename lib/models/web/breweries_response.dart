class BreweryResponse {
  Meta? meta;
  List<Data>? data;

  BreweryResponse({this.meta, this.data});

  BreweryResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? id;
  String? name;
  String? address;
  String? city;
  String? country;

  Data({this.id, this.name, this.address, this.city, this.country});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}

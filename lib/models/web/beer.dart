import 'package:beer_app_icapps/models/web/brewery.dart';

class BeerWeb {
  String? id;
  String? name;
  int? rating;
  String? thumbImageUrl;
  String? imageUrl;
  Brewery? brewery;

  BeerWeb(
      {this.id,
      this.name,
      this.rating,
      this.thumbImageUrl,
      this.imageUrl,
      this.brewery});

  BeerWeb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    thumbImageUrl = json['thumbImageUrl'];
    imageUrl = json['imageUrl'];
    brewery =
        json['brewery'] != null ? Brewery.fromJson(json['brewery']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rating'] = rating;
    data['thumbImageUrl'] = thumbImageUrl;
    data['imageUrl'] = imageUrl;
    if (brewery != null) {
      data['brewery'] = brewery!.toJson();
    }
    return data;
  }
}

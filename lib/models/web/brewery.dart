class Brewery {
  String? id;
  String? name;
  String? address;
  String? city;
  String? country;

  Brewery({this.id, this.name, this.address, this.city, this.country});

  Brewery.fromJson(Map<String, dynamic> json) {
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

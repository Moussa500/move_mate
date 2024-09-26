import 'package:move_mate/core/base/base_model.dart';

class SelledHouse extends BaseModel {
  final String? title;
  final String? description;
  final String? city;
  final String? image;
  final String? price;
  final String? village;
  final String? area;
  final String? mapsLocation;
  final int? owner;
  SelledHouse(
      {this.village,
      this.title,
      this.description,
      this.city,
      this.image,
      this.price,
      this.area,
      this.mapsLocation,
      this.owner});
  @override
  fromJson(Map<String, dynamic> json) {
    return SelledHouse(
        village: json["village"],
        title: json["title"],
        description: json["description"],
        city: json["city"],
        image: json["image"],
        price: json["price"],
        area: json["area"],
        mapsLocation: json["maps_location"],
        owner: json["owner"]);
  }

  @override
  List<Object?> get props =>
      [title, description, city, image, price, area, image];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "city": city,
      "description": description,
      "village": village,
      "image": image,
      "price": image,
      "area": area,
      "maps_location": mapsLocation,
      "owner": owner,
    };
  }
}

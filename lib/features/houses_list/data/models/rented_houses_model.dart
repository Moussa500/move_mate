import 'package:move_mate/core/base/base_model.dart';

class RentedHouses extends BaseModel<RentedHouses> {
  final String? title;
  final int? id;
  final String? description;
  final String? city;
  final String? image;
  final String? price;
  final String? village;
  final String? priceUnity;
  final String? area;
  final String? mapsLocation;
  final int? owner;
  RentedHouses(
      {this.id,
      this.village,
      this.title,
      this.description,
      this.city,
      this.image,
      this.price,
      this.priceUnity,
      this.area,
      this.mapsLocation,
      this.owner});
  @override
  RentedHouses fromJson(Map<String, dynamic> json) {
    return RentedHouses(
        village: json["village"],
        id:json["id"],
        title: json["title"],
        description: json["description"],
        city: json["city"],
        image: json["image"],
        price: json["price"],
        priceUnity: json["price_unity"],
        area: json["area"],
        mapsLocation: json["maps_location"],
        owner: json["owner"]);
  }

  @override
  List<Object?> get props => [
        title,
        description,
        city,
        image,
        price,
        priceUnity,
        area,
        image,
        owner,
        mapsLocation,
        village,
        id
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "city": city,
      "description": description,
      "village": village,
      "image": image,
      "price": price,
      "price_unity": priceUnity,
      "area": area,
      "maps_location": mapsLocation,
      "owner": owner,
    };
  }
}


import 'dart:convert';
// import 'package:api_new/model/hotel_categories.dart';
// import 'package:api_new/model/hotel_likeDislike.dart';
import 'package:api_new/model/hotel_categories.dart';
import 'package:api_new/model/icons.dart';
//
Properties propertiesFromJson(String str) =>
    Properties.fromJson(json.decode(str));

String propertiesToJson(Properties data) => json.encode(data.toJson());

class Properties {
  final List<Hotel> hotels;

  Properties({
    required this.hotels,
  });

  Properties copyWith({
    List<Hotel>? hotels,
  }) =>
      Properties(
        hotels: hotels ?? this.hotels,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        hotels: List<Hotel>.from(json["hotels"].map((x) => Hotel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotels": List<dynamic>.from(hotels.map((x) => x.toJson())),
      };
}

class Hotel {
  final String name;
  final String reception;
  final int discount;
  final String description;
  final String city;
  final String location;
  final String starRate;
  final String roomRate;
  final int id;
  final String profilePicture;
  final List<String> images; // Change to List<String>
  // final Categories categories;
  // final LikeDislike likeDislike;
  // final Amenity amenities;
  Hotel(
       {
        required this.name,
        required this.reception,
        required this.discount,
        required this.description,
        required this.location,
         required this.city,
        required this.starRate,
        required this.roomRate,
        required this.id,
        required this.profilePicture,
        required this.images,
    // required this.categories,
    // required this.likeDislike,
    // required this.amenities,
  });
  // Hotel copyWith({
  //   String? name,
  //   int? id,
  //   String? reception,
  //   int? discount,
  //   String? description,
  //   String? location,
  //   String? starRate,
  //   String? roomRate,
  //   String? profilePicture,
  //   List<String>? images,
  //   // Categories? categories,
  //   // LikeDislike? likeDislike
  // }) =>
  //     Hotel(
  //       name: name ?? this.name,
  //       id: id ?? this.id,
  //       reception: reception ?? this.reception,
  //       discount: discount ?? this.discount,
  //       description: description ?? this.description,
  //       location: location ?? this.location,
  //       starRate: starRate ?? this.starRate,
  //       roomRate: roomRate ?? this.roomRate,
  //       profilePicture: profilePicture ?? this.profilePicture,
  //       images: images ?? this.images,
  //       // categories: categories ?? this.categories,
  //       // likeDislike: likeDislike ?? this.likeDislike,
  //       // amenities: amenities,
  //     );

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      reception: json['reception'],
      discount: json['discount'],
      description: json['description'],
      location: json['location'],
      city: json['city'],
      starRate: json['starRate'],
      roomRate: json['roomRate'],
      id: json['id'],
      profilePicture: json['profilePicture'],
      images: json['images'] != null
          ? List<String>.from(json['images'].map((x) => x))
          : [], // Check for null before mapping
    );
  }
  Map<String, dynamic> toJson() => {
        "images": List<String>.from(images.map((x) => x)),
        "name": name,
        "id": id,
        "reception": reception,
        "discount": discount,
        "description": description,
        "location": location,
    "city": city,
        "starRate": starRate,
        "roomRate": roomRate,
        "profilePicture": profilePicture,
        // "categories": categories.toString(),
        // "likeDislike": likeDislike,
      };
}

enum Roomsize {
  THE_11_MSQ_118_FTSQ,
  THE_13_MSQ_140_FTSQ,
  THE_15_MSQ_161_FTSQ,
  THE_20_MSQ_215_FTSQ,
  THE_25_MSQ_269_FTSQ
}
final roomsizeValues = EnumValues({
  "11/MSQ, 118/FTSQ": Roomsize.THE_11_MSQ_118_FTSQ,
  "13/MSQ, 140/FTSQ": Roomsize.THE_13_MSQ_140_FTSQ,
  "15/MSQ, 161/FTSQ": Roomsize.THE_15_MSQ_161_FTSQ,
  "20/MSQ, 215/FTSQ": Roomsize.THE_20_MSQ_215_FTSQ,
  "25/MSQ, 269/FTSQ": Roomsize.THE_25_MSQ_269_FTSQ
});
enum Reception { Manned, Unmanned }
final receptionValues =
    EnumValues({"manned": Reception.Manned, "unmanned": Reception.Unmanned});


class HotelIcons {
  String get redHeartIcon => getRedHeartSVGPath();
  String get starRateIcon => getStarRateSVGPath();
  String get arrowIcon => getArrowSVGPath();
  String get blueHeartIcon => getBlueHeartSVGPath();
  String get coffeeIcon => getCoffeeSVGPath();
  String get locationIcon => getLocationSVGPath();
  String get moreIcon => getMoreSVGPath();
  String get wifiIcon => getWifiSVGPath();
}






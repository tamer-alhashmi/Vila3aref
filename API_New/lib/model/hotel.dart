// To parse this JSON data, do
//
//     final properties = propertiesFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:api_new/model/icons.dart';

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
  final int id;
  // final Reception reception;
  final int discount;
  final String description;
  final String location;
  final String starRate;
  final String roomRate;
  final String profilePicture;
  final List<String> images;
  // final Categories categories;
  // final LikeDislike likeDislike;

  Hotel({
    required this.name,
    required this.id,
    // required this.reception,
    required this.discount,
    required this.description,
    required this.location,
    required this.starRate,
    required this.roomRate,
    required this.profilePicture,
    required this.images,
    // required this.categories,
    // required this.likeDislike,
  });
  Hotel copyWith({
    String? name,
    int? id,
    // Reception? reception,
    int? discount,
    String? description,
    String? location,
    String? starRate,
    String? roomRate,
    String? profilePicture,
    List<String>? images,
    // Categories? categories,
    // LikeDislike? likeDislike,
  }) =>
      Hotel(
        name: name ?? this.name,
        id: id ?? this.id,
        // reception: reception ?? this.reception,
        discount: discount ?? this.discount,
        description: description ?? this.description,
        location: location ?? this.location,
        starRate: starRate ?? this.starRate,
        roomRate: roomRate ?? this.roomRate,
        profilePicture: profilePicture ?? this.profilePicture,
        images: images ?? this.images,
        // categories: categories ?? this.categories,
        // likeDislike: likeDislike ?? this.likeDislike,
      );

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        name: json["name"],
        id: json["id"],
    // reception: receptionValues.map[json["reception"]],
    discount: json["discount"],
    description: json["description"],
        location: json["location"],
        starRate: json["starRate"],
        roomRate: json["roomRate"],
        profilePicture: json["profilePicture"],
        images: List<String>.from(json["images"].map((x) => x)),
        // categories: Categories.fromJson(json["categories"]),
        // likeDislike: LikeDislike.fromJson(json["likeDislike"]),
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "name": name,
        "id": id,
        // "reception": receptionValues.reverse[reception],
        "discount": discount,
        "description": description,
        "location": location,
        "starRate": starRate,
        "roomRate": roomRate,
        "profilePicture": profilePicture,
        // "categories": categories.toJson(),
        // "likeDislike": likeDislike.toJson(),
      };
}

class Categories {
  final DeluxeDoubleRoomEnsuite deluxeDoubleRoomEnsuite;
  final DeluxeDoubleRoomEnsuite familyRoomDeluxeEnsuiteWithKitchenette;
  final DeluxeDoubleRoomEnsuite tripleRoomDeluxeEnsuite;
  final DeluxeDoubleRoomEnsuite standardDoubleRoomEnsuite;
  final DeluxeDoubleRoomEnsuite twinRoomStandardEnsuite;

  Categories({
    required this.deluxeDoubleRoomEnsuite,
    required this.familyRoomDeluxeEnsuiteWithKitchenette,
    required this.tripleRoomDeluxeEnsuite,
    required this.standardDoubleRoomEnsuite,
    required this.twinRoomStandardEnsuite,
  });

  Categories copyWith({
    DeluxeDoubleRoomEnsuite? deluxeDoubleRoomEnsuite,
    DeluxeDoubleRoomEnsuite? familyRoomDeluxeEnsuiteWithKitchenette,
    DeluxeDoubleRoomEnsuite? tripleRoomDeluxeEnsuite,
    DeluxeDoubleRoomEnsuite? standardDoubleRoomEnsuite,
    DeluxeDoubleRoomEnsuite? twinRoomStandardEnsuite,
  }) =>
      Categories(
        deluxeDoubleRoomEnsuite:
            deluxeDoubleRoomEnsuite ?? this.deluxeDoubleRoomEnsuite,
        familyRoomDeluxeEnsuiteWithKitchenette:
            familyRoomDeluxeEnsuiteWithKitchenette ??
                this.familyRoomDeluxeEnsuiteWithKitchenette,
        tripleRoomDeluxeEnsuite:
            tripleRoomDeluxeEnsuite ?? this.tripleRoomDeluxeEnsuite,
        standardDoubleRoomEnsuite:
            standardDoubleRoomEnsuite ?? this.standardDoubleRoomEnsuite,
        twinRoomStandardEnsuite:
            twinRoomStandardEnsuite ?? this.twinRoomStandardEnsuite,
      );

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        deluxeDoubleRoomEnsuite: DeluxeDoubleRoomEnsuite.fromJson(
            json["Deluxe-Double room-Ensuite"]),
        familyRoomDeluxeEnsuiteWithKitchenette:
            DeluxeDoubleRoomEnsuite.fromJson(
                json["Family room Deluxe Ensuite with kitchenette"]),
        tripleRoomDeluxeEnsuite: DeluxeDoubleRoomEnsuite.fromJson(
            json["Triple room-Deluxe-Ensuite"]),
        standardDoubleRoomEnsuite: DeluxeDoubleRoomEnsuite.fromJson(
            json["Standard-Double room-Ensuite"]),
        twinRoomStandardEnsuite: DeluxeDoubleRoomEnsuite.fromJson(
            json["Twin room-Standard-Ensuite"]),
      );

  Map<String, dynamic> toJson() => {
        "Deluxe-Double room-Ensuite": deluxeDoubleRoomEnsuite.toJson(),
        "Family room Deluxe Ensuite with kitchenette":
            familyRoomDeluxeEnsuiteWithKitchenette.toJson(),
        "Triple room-Deluxe-Ensuite": tripleRoomDeluxeEnsuite.toJson(),
        "Standard-Double room-Ensuite": standardDoubleRoomEnsuite.toJson(),
        "Twin room-Standard-Ensuite": twinRoomStandardEnsuite.toJson(),
      };
}

class DeluxeDoubleRoomEnsuite {
  final Catname catname;
  final String categorydescreption;
  final Roomsize roomsize;
  final List<Amenity> amenities;

  DeluxeDoubleRoomEnsuite({
    required this.catname,
    required this.categorydescreption,
    required this.roomsize,
    required this.amenities,
  });

  DeluxeDoubleRoomEnsuite copyWith({
    Catname? catname,
    String? categorydescreption,
    Roomsize? roomsize,
    List<Amenity>? amenities,
  }) =>
      DeluxeDoubleRoomEnsuite(
        catname: catname ?? this.catname,
        categorydescreption: categorydescreption ?? this.categorydescreption,
        roomsize: roomsize ?? this.roomsize,
        amenities: amenities ?? this.amenities,
      );

  factory DeluxeDoubleRoomEnsuite.fromJson(Map<String, dynamic> json) =>
      DeluxeDoubleRoomEnsuite(
        catname: json["catname"],
        categorydescreption: json["categorydescreption"],
        roomsize: json["roomsize"],
        amenities: List<Amenity>.from(
            json["amenities"].map((x) => amenityValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "catname": catnameValues.reverse[catname],
        "categorydescreption": categorydescreption,
        "roomsize": roomsizeValues.reverse[roomsize],
        "amenities":
            List<dynamic>.from(amenities.map((x) => amenityValues.reverse[x])),
      };
}

enum Amenity {
  ACCESSED_BY_STAIRCASE,
  AMENITY_FIRE_EXTINGUISHER,
  CARBON_MONOXIDE_DETECTOR,
  CARPETED_FLOOR,
  ELECTRIC_KETTLE,
  FIRE_EXTINGUISHER,
  FREEVIEW_TV,
  FREE_TOILETRIES,
  FREE_WI_FI_INTERNET,
  HEATING,
  HIGH_QUALITY_BEDDING,
  HOT_WATER,
  LINEN_PROVIDED,
  LOCKBOX_ACCESS,
  LOCK_ON_BEDROOM_DOOR_S,
  NON_SMOKING,
  POTENTIAL_FOR_NOISE,
  ROOM_UNIT_ON_THE_GROUND_FLOOR,
  RUBBISH_BIN,
  SHOWER_ONLY,
  SMOKE_DETECTOR,
  TEA_AND_COFFEE_MAKING_FACILITIES,
  TOILET_PAPER_AND_SOAP,
  TOWELS,
  WARDROBE
}

final amenityValues = EnumValues({
  "Accessed by staircase": Amenity.ACCESSED_BY_STAIRCASE,
  "Fire Extinguisher": Amenity.AMENITY_FIRE_EXTINGUISHER,
  "Carbon monoxide detector": Amenity.CARBON_MONOXIDE_DETECTOR,
  "Carpeted floor": Amenity.CARPETED_FLOOR,
  "Electric Kettle": Amenity.ELECTRIC_KETTLE,
  "FireExtinguisher": Amenity.FIRE_EXTINGUISHER,
  "Freeview TV": Amenity.FREEVIEW_TV,
  "Free Toiletries": Amenity.FREE_TOILETRIES,
  "Free WiFi Internet": Amenity.FREE_WI_FI_INTERNET,
  "Heating": Amenity.HEATING,
  "HighQuality bedding": Amenity.HIGH_QUALITY_BEDDING,
  "Hot water": Amenity.HOT_WATER,
  "Linen Provided": Amenity.LINEN_PROVIDED,
  "Lockbox access": Amenity.LOCKBOX_ACCESS,
  "Lock on bedroom door(s)": Amenity.LOCK_ON_BEDROOM_DOOR_S,
  "Non-smoking": Amenity.NON_SMOKING,
  "Potential for noise": Amenity.POTENTIAL_FOR_NOISE,
  "Room/unit on the ground floor": Amenity.ROOM_UNIT_ON_THE_GROUND_FLOOR,
  "Rubbish Bin": Amenity.RUBBISH_BIN,
  "Shower Only": Amenity.SHOWER_ONLY,
  "SmokeDetector": Amenity.SMOKE_DETECTOR,
  "Tea and coffee-making facilities": Amenity.TEA_AND_COFFEE_MAKING_FACILITIES,
  "ToiletPaper and soap": Amenity.TOILET_PAPER_AND_SOAP,
  "Towels": Amenity.TOWELS,
  "Wardrobe": Amenity.WARDROBE
});

enum Catname {
  DELUXE_DOUBLE_ROOM_ENSUITE,
  FAMILY_ROOM_DELUXE_ENSUITE_WITH_KITCHENETTE,
  STANDARD_DOUBLE_ROOM_ENSUITE,
  TRIPLE_ROOM_DELUXE_ENSUITE,
  TWIN_ROOM_STANDARD_ENSUITE
}

final catnameValues = EnumValues({
  "Deluxe-Double room-Ensuite": Catname.DELUXE_DOUBLE_ROOM_ENSUITE,
  "Family room-Deluxe-Ensuite-with kitchenette":
      Catname.FAMILY_ROOM_DELUXE_ENSUITE_WITH_KITCHENETTE,
  "Standard-Double room-Ensuite": Catname.STANDARD_DOUBLE_ROOM_ENSUITE,
  "Triple room-Deluxe-Ensuite": Catname.TRIPLE_ROOM_DELUXE_ENSUITE,
  "Twin room-Standard-Ensuite": Catname.TWIN_ROOM_STANDARD_ENSUITE
});

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

class LikeDislike {
  final int likes;
  final int dislikes;
  final int userAction;

  LikeDislike({
    required this.likes,
    required this.dislikes,
    required this.userAction,
  });

  LikeDislike copyWith({
    int? likes,
    int? dislikes,
    int? userAction,
  }) =>
      LikeDislike(
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
        userAction: userAction ?? this.userAction,
      );

  factory LikeDislike.fromJson(Map<String, dynamic> json) => LikeDislike(
        likes: json["likes"],
        dislikes: json["dislikes"],
        userAction: json["userAction"],
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "dislikes": dislikes,
        "userAction": userAction,
      };
}

// enum Reception { MANNED, UNMANNED }
//
// final receptionValues =
//     EnumValues({"manned": Reception.MANNED, "unmanned": Reception.UNMANNED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

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


// import 'package:apireset2/model/hotel_categories.dart';
// import 'package:apireset2/model/hotel_likeDislike.dart';

//
//  var hotel = Hotel;
// class Hotel {
//   final String name;
//   final String reception;
//   final String description;
//   final String location;
//   final String roomRate;
//   final String starRate;
//   final int id;
//   final String profilePicture;
//   final List<String> images;
//   // final LikeDisLike likeDislike;
//   // final String categories;
//   // final String amenities;
//
//   Hotel({
//     required this.name,
//     required this.reception,
//     required this.description,
//     required this.location,
//     required this.starRate,
//     required this.roomRate,
//     required this.id,
//     required this.profilePicture,
//     required this.images,
//     // required this.categories,
//     // required this.likeDislike,
//     // required this.amenities,
//   });
// }
//
//
//
// const String starIcon = 'assets/icons/ant-design_star-filled.svg';
// const String redHeartSVG = 'assets/icons/red_heart_SVG.svg';
// const String wifiSvg = 'assets/icons/wifi.svg';
// const String arrowSvg = 'assets/icons/Arrow-Left2.svg';
// const String blueHeartSvg = 'assets/icons/Blue_heart_SVG.svg';
// const String coffeeSvg = 'assets/icons/coffee.svg';
// const String locationSvg = 'assets/icons/location.svg';
// const String moreSvg = 'assets/icons/more.svg';

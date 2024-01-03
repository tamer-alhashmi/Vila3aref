// To parse this JSON data, do
//
//     final hotelsApi = hotelsApiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HotelsApi hotelsApiFromJson(String str) => HotelsApi.fromJson(json.decode(str));

String hotelsApiToJson(HotelsApi data) => json.encode(data.toJson());

class HotelsApi {
  final List<Property> property;

  HotelsApi({
    required this.property,
  });

  HotelsApi copyWith({
    List<Property>? property,
  }) =>
      HotelsApi(
        property: property ?? this.property,
      );

  factory HotelsApi.fromJson(Map<String, dynamic> json) => HotelsApi(
    property: List<Property>.from(json["property"].map((x) => Property.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "property": List<dynamic>.from(property.map((x) => x.toJson())),
  };
}

class Property {
  final String name;
  final int id;
  final Reception reception;
  final int discount;
  final String description;
  final String location;
  final String starRate;
  final String roomRate;
  final String profilePicture;
  final List<Image> images;
  final Categories categories;
  final LikeDislike likeDislike;

  Property({
    required this.name,
    required this.id,
    required this.reception,
    required this.discount,
    required this.description,
    required this.location,
    required this.starRate,
    required this.roomRate,
    required this.profilePicture,
    required this.images,
    required this.categories,
    required this.likeDislike,
  });

  Property copyWith({
    String? name,
    int? id,
    Reception? reception,
    int? discount,
    String? description,
    String? location,
    String? starRate,
    String? roomRate,
    String? profilePicture,
    List<Image>? images,
    Categories? categories,
    LikeDislike? likeDislike,
  }) =>
      Property(
        name: name ?? this.name,
        id: id ?? this.id,
        reception: reception ?? this.reception,
        discount: discount ?? this.discount,
        description: description ?? this.description,
        location: location ?? this.location,
        starRate: starRate ?? this.starRate,
        roomRate: roomRate ?? this.roomRate,
        profilePicture: profilePicture ?? this.profilePicture,
        images: images ?? this.images,
        categories: categories ?? this.categories,
        likeDislike: likeDislike ?? this.likeDislike,
      );

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    name: json["name"],
    id: json["id"],
    reception: receptionValues.map[json["reception"]],
    discount: json["discount"],
    description: json["description"],
    location: json["location"],
    starRate: json["starRate"],
    roomRate: json["roomRate"],
    profilePicture: json["profilePicture"],
    images: List<Image>.from(json["images"].map((x) => imageValues.map[x])),
    categories: Categories.fromJson(json["categories"]),
    likeDislike: LikeDislike.fromJson(json["likeDislike"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "reception": receptionValues.reverse[reception],
    "discount": discount,
    "description": description,
    "location": location,
    "starRate": starRate,
    "roomRate": roomRate,
    "profilePicture": profilePicture,
    "images": List<dynamic>.from(images.map((x) => imageValues.reverse[x])),
    "categories": categories.toJson(),
    "likeDislike": likeDislike.toJson(),
  };
}

class Categories {
  final DeluxeDoubleRoomEnsuite deluxeDoubleRoomEnsuite;
  final DeluxeDoubleRoomEnsuite familyRoomDeluxeEnsuiteKitchenette;
  final DeluxeDoubleRoomEnsuite tripleRoomDeluxeEnsuite;
  final DeluxeDoubleRoomEnsuite standardDoubleRoomEnsuite;
  final DeluxeDoubleRoomEnsuite twinRoomStandardEnsuite;

  Categories({
    required this.deluxeDoubleRoomEnsuite,
    required this.familyRoomDeluxeEnsuiteKitchenette,
    required this.tripleRoomDeluxeEnsuite,
    required this.standardDoubleRoomEnsuite,
    required this.twinRoomStandardEnsuite,
  });

  Categories copyWith({
    DeluxeDoubleRoomEnsuite? deluxeDoubleRoomEnsuite,
    DeluxeDoubleRoomEnsuite? familyRoomDeluxeEnsuiteKitchenette,
    DeluxeDoubleRoomEnsuite? tripleRoomDeluxeEnsuite,
    DeluxeDoubleRoomEnsuite? standardDoubleRoomEnsuite,
    DeluxeDoubleRoomEnsuite? twinRoomStandardEnsuite,
  }) =>
      Categories(
        deluxeDoubleRoomEnsuite: deluxeDoubleRoomEnsuite ?? this.deluxeDoubleRoomEnsuite,
        familyRoomDeluxeEnsuiteKitchenette: familyRoomDeluxeEnsuiteKitchenette ?? this.familyRoomDeluxeEnsuiteKitchenette,
        tripleRoomDeluxeEnsuite: tripleRoomDeluxeEnsuite ?? this.tripleRoomDeluxeEnsuite,
        standardDoubleRoomEnsuite: standardDoubleRoomEnsuite ?? this.standardDoubleRoomEnsuite,
        twinRoomStandardEnsuite: twinRoomStandardEnsuite ?? this.twinRoomStandardEnsuite,
      );

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    deluxeDoubleRoomEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["DeluxeDoubleRoomEnsuite"]),
    familyRoomDeluxeEnsuiteKitchenette: DeluxeDoubleRoomEnsuite.fromJson(json["FamilyRoomDeluxeEnsuite_kitchenette"]),
    tripleRoomDeluxeEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["TripleRoomDeluxeEnsuite"]),
    standardDoubleRoomEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["StandardDoubleRoomEnsuite"]),
    twinRoomStandardEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["TwinRoomStandardEnsuite"]),
  );

  Map<String, dynamic> toJson() => {
    "DeluxeDoubleRoomEnsuite": deluxeDoubleRoomEnsuite.toJson(),
    "FamilyRoomDeluxeEnsuite_kitchenette": familyRoomDeluxeEnsuiteKitchenette.toJson(),
    "TripleRoomDeluxeEnsuite": tripleRoomDeluxeEnsuite.toJson(),
    "StandardDoubleRoomEnsuite": standardDoubleRoomEnsuite.toJson(),
    "TwinRoomStandardEnsuite": twinRoomStandardEnsuite.toJson(),
  };
}

class DeluxeDoubleRoomEnsuite {
  final int personNumber;
  final Catname catname;
  final String categorydescreption;
  final Roomsize roomsize;
  final List<Amenity> amenities;

  DeluxeDoubleRoomEnsuite({
    required this.personNumber,
    required this.catname,
    required this.categorydescreption,
    required this.roomsize,
    required this.amenities,
  });

  DeluxeDoubleRoomEnsuite copyWith({
    int? personNumber,
    Catname? catname,
    String? categorydescreption,
    Roomsize? roomsize,
    List<Amenity>? amenities,
  }) =>
      DeluxeDoubleRoomEnsuite(
        personNumber: personNumber ?? this.personNumber,
        catname: catname ?? this.catname,
        categorydescreption: categorydescreption ?? this.categorydescreption,
        roomsize: roomsize ?? this.roomsize,
        amenities: amenities ?? this.amenities,
      );

  factory DeluxeDoubleRoomEnsuite.fromJson(Map<String, dynamic> json) => DeluxeDoubleRoomEnsuite(
    personNumber: json["personNumber"],
    catname: Catname.map[json["cat"]],
    categorydescreption: json["categorydescreption"],
    roomsize: roomsizeValues.map[json["roomsize"]],
    amenities: List<Amenity>.from(json["amenities"].map((x) => amenityValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "personNumber": personNumber,
    "catname": catnameValues.reverse[catname],
    "categorydescreption": categorydescreption,
    "roomsize": roomsizeValues.reverse[roomsize],
    "amenities": List<dynamic>.from(amenities.map((x) => amenityValues.reverse[x])),
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
  TWIN_ROOM_STANDARD_ENSUITE, map
}

final catnameValues = EnumValues({
  "DeluxeDoubleRoomEnsuite": Catname.DELUXE_DOUBLE_ROOM_ENSUITE,
  "Family room-Deluxe-Ensuite-with kitchenette": Catname.FAMILY_ROOM_DELUXE_ENSUITE_WITH_KITCHENETTE,
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

enum Image {
  RUSSELL_1_JPG,
  THE_1_JPG,
  THE_2_JPG,
  THE_3_JPG,
  THE_4_JPG,
  THE_5_JPG,
  THE_6_JPG,
  THE_7_JPG
}

final imageValues = EnumValues({
  "Russell_1.jpg": Image.RUSSELL_1_JPG,
  "1.jpg": Image.THE_1_JPG,
  "2.jpg": Image.THE_2_JPG,
  "3.jpg": Image.THE_3_JPG,
  "4.jpg": Image.THE_4_JPG,
  "5.jpg": Image.THE_5_JPG,
  "6.jpg": Image.THE_6_JPG,
  "7.jpg": Image.THE_7_JPG
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

enum Reception {
  manned,
  unmanned
}

final receptionValues = EnumValues({
  "manned": Reception.manned,
  "unmanned": Reception.unmanned
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

























// import 'dart:convert';
// // import '../model/hotel_categories.dart';
// // import 'package:apireset2/model/hotel_likeDislike.dart';
// import 'package:api_new/model/hotel_categories.dart';
// import 'package:api_new/model/hotel_likeDislike.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/hotel.dart';
//
// class HotelsApi {
//   static Future<List<Hotel>> fetchHotel() async {
//     if (kDebugMode) {
//       print('fetchHotel Called');
//     }
//     const url =
//         'https://raw.githubusercontent.com/tamer-alhashmi/Vila3aref/master/API_New/json_files/properties.json';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final property = json['property'] as List<dynamic>;
//     final hotels = property.map((e) {
//       final categories = HotelCategory(
//         deluxeDoubleRoomEnsuite:
//             e['categories']['DeluxeDoubleRoomEnsuite'].toString(),
//         familyRoomDeluxeEnsuiteWithkitchenette: e['categories']
//                 ['FamilyRoomDeluxeEnsuiteWithkitchenette']
//             .toString(),
//         standardDoubleRoomEnsuite:
//             e['categories']['StandardDoubleRoomEnsuite'].toString(),
//         tripleRoomDeluxeEnsuite:
//             e['categories']['TripleRoomDeluxeEnsuite'].toString(),
//         twinRoomStandardEnsuite:
//             e['categories']['TwinRoomStandardEnsuite'].toString(),
//       );
//
//       final likeDislike = LikeDisLike(
//       likes: e['likeDislike']['likes'],
//       dislikes: e['likeDislike']['dislikes'],
//       userAction: e['likeDislike']['userAction']);
//
//       return Hotel(
//         name: e['name'],
//         // reception: e['reception'],
//         discount:e['discount'],
//         description: e['description'],
//         location: e['location'],
//         starRate: e['starRate'],
//         roomRate: e['roomRate'],
//         id: e['id'],
//         profilePicture: e['profilePicture'],
//         images: List<String>.from(e['images']),
//         categories: e['categories'],
//         likeDislike: e['likeDislike'], // Convert to List<String>
//         amenities: e['categories'][CategoryAmenities] ,
//       );
//     }).toList();
//     return hotels;
//     // ignore: dead_code
//     if (kDebugMode) {
//       print('FetchUser Completed');
//     }
//   }
// }

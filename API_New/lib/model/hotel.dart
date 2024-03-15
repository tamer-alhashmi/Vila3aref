import 'dart:core';
// import 'package:api_new/model/hotel_categories.dart';
// import 'package:api_new/model/hotel_likeDislike.dart';
import 'package:api_new/model/hotel_categories.dart';
import 'package:api_new/model/hotel_policies.dart';
import 'package:api_new/services/nearby_places.dart';

class Hotel {
  final String name;
  final String reception;
  final int discount;
  final String description;
  final String city;
  final String address;
  final double lat;
  final double lng;
  final String starRate;
  final String roomRate;
  final int id;
  final String profilePicture;
  final List<String> images; // Change to List<String>
  // final Categories categories;
  // final LikeDislike likeDislike;
  final List<String> amenities;
  final HotelPolicies policies;
  final List<Place> nearbyPlaces;
  Hotel({
    required this.name,
    required this.reception,
    required this.discount,
    required this.description,
    required this.city,
    required this.address,
    required this.lat,
    required this.lng,
    required this.starRate,
    required this.roomRate,
    required this.id,
    required this.profilePicture,
    required this.images,
    required this.amenities,
    required this.policies,
    required this.nearbyPlaces,
    // required this.categories,
    // required this.likeDislike,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      reception: json['reception'],
      discount: json['discount'],
      description: json['description'],
      address: json['address'],
      lat: json['lat'],
      lng: json['lng'],
      city: json['city'],
      starRate: json['starRate'],
      roomRate: json['roomRate'],
      id: json['id'],
      profilePicture: json['profilePicture'],
      images: json['images'] != null
          ? List<String>.from(json['images'].map((x) => x))
          : [],
      amenities: json['amenities'] != null
          ? List<String>.from(json['amenities'].map((x) => x))
          : [],
      policies: HotelPolicies.fromJson(json['policies'] ?? {}),
      nearbyPlaces: [], // Initialize the nearbyPlaces list
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "reception": reception,
        "discount": discount,
        "description": description,
        "address": address,
        "lat": lat,
        "lng": lng,
        "city": city,
        "starRate": starRate,
        "roomRate": roomRate,
        "profilePicture": profilePicture,
        "images": List<String>.from(images.map((x) => x)),
        "amenities": List<String>.from(amenities.map((x) => x)),
        "policies": policies,
        "nearbyPlaces": List<dynamic>.from(nearbyPlaces.map((x) => x.toJson())),
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

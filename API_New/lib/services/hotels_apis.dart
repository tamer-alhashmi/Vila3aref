import 'dart:convert';
// import '../model/hotel_categories.dart';
// import 'package:apireset2/model/hotel_likeDislike.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/hotel.dart';


class HotelsApi {
  static Future<List<Hotel>> fetchHotel() async {
    if (kDebugMode) {
      print('fetchHotel Called');
    }
    const url =
        'https://raw.githubusercontent.com/tamer-alhashmi/ResetApi/main/json/properties.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final property = json['property'] as List<dynamic>;
    final hotels = property.map((e) {
      // final categories = HotelCategory(
      //   deluxeDoubleRoomEnsuite:
      //       e['categories']['DeluxeDoubleRoomEnsuite'].toString(),
      //   familyRoomDeluxeEnsuiteWithkitchenette: e['categories']
      //           ['FamilyRoomDeluxeEnsuiteWithkitchenette']
      //       .toString(),
      //   standardDoubleRoomEnsuite:
      //       e['categories']['StandardDoubleRoomEnsuite'].toString(),
      //   tripleRoomDeluxeEnsuite:
      //       e['categories']['TripleRoomDeluxeEnsuite'].toString(),
      //   twinRoomStandardEnsuite:
      //       e['categories']['TwinRoomStandardEnsuite'].toString(),
      // );
      //
      // final likeDislike = LikeDisLike(
      // likes: e['likeDislike']['likes'],
      // dislikes: e['likeDislike']['dislikes'],
      // userAction: e['likeDislike']['userAction'],

      return Hotel(
        name: e['name'],
        reception: e['reception'],
        description: e['description'],
        location: e['location'],
        starRate: e['starRate'].toString(),
        roomRate: e['roomRate'].toString(),
        id: e['id'],
        profilePicture: e['profilePicture'],
        images: e['images'],
        // likeDislike: e['likeDislike'],
        // categories: e['categories'],
        // amenities: e['categories'][CategoryAmenities] ,
      );
    }).toList();
    return hotels;
    // ignore: dead_code
    if (kDebugMode) {
      print('FetchUser Completed');
    }
  }
}

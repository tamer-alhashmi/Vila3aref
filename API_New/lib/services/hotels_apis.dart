import 'dart:convert';
// import '../model/hotel_categories.dart';
// import 'package:apireset2/model/hotel_likeDislike.dart';
import 'package:api_new/model/hotel_categories.dart';
import 'package:api_new/model/hotel_likeDislike.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/hotel.dart';

class HotelsApi {
  static Future<List<Hotel>> fetchHotel() async {
    if (kDebugMode) {
      print('fetchHotel Called');
    }
    const url =
        'https://raw.githubusercontent.com/tamer-alhashmi/Vila3aref/master/API_New/json_files/properties.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final property = json['property'] as List<dynamic>;
    final hotels = property.map((e) {
      final categories = HotelCategory(
        deluxeDoubleRoomEnsuite:
            e['categories']['DeluxeDoubleRoomEnsuite'].toString(),
        familyRoomDeluxeEnsuiteWithkitchenette: e['categories']
                ['FamilyRoomDeluxeEnsuiteWithkitchenette']
            .toString(),
        standardDoubleRoomEnsuite:
            e['categories']['StandardDoubleRoomEnsuite'].toString(),
        tripleRoomDeluxeEnsuite:
            e['categories']['TripleRoomDeluxeEnsuite'].toString(),
        twinRoomStandardEnsuite:
            e['categories']['TwinRoomStandardEnsuite'].toString(),
      );

      final likeDislike = LikeDisLike(
      likes: e['likeDislike']['likes'],
      dislikes: e['likeDislike']['dislikes'],
      userAction: e['likeDislike']['userAction']);

      return Hotel(
        name: e['name'],
        // reception: e['reception'],
        discount:e['discount'],
        description: e['description'],
        location: e['location'],
        starRate: e['starRate'],
        roomRate: e['roomRate'],
        id: e['id'],
        profilePicture: e['profilePicture'],
        // images: List<String>.from(e['images']),
        images: List<String>.from(e['images']),

        categories: e['categories'],
        likeDislike: e['likeDislike'], // Convert to List<String>
        amenities: e['categories'][CategoryAmenities] ,
      );
    }).toList();
    return hotels;
    // ignore: dead_code
    if (kDebugMode) {
      print('FetchUser Completed');
    }
  }
}

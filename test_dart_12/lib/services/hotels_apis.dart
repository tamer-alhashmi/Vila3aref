import 'dart:convert';
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
    final hotel = json['hotel'] as List<dynamic>;
    if (kDebugMode) {
      print('fetchHotel Success');
    }
    final hotels = hotel.map((e) {
      return Hotel(
        name: e['name'],
        reception: e['reception'],
        discount: e['discount'],
        description: e['description'],
        city: e['city'],
        location: e['location'],
        lat: e['lat'],
        lng: e['lng'],
        starRate: e['starRate'],
        roomRate: e['roomRate'],
        id: e['id'],
        profilePicture: e['profilePicture'],
        images: List<String>.from(e["images"].map((x) => x)),
        amenities: List<String>.from(e["amenities"].map((x) => x)),
        // categories: e['categories'],
        // likeDislike: e['likeDislike'], // Convert to List<String>
      );
    }).toList();
    return hotels;
    // ignore: dead_code
    if (kDebugMode) {
      print('FetchUser Completed');
    }
  }
}

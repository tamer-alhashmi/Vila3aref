import 'dart:convert';
import 'package:api_new/model/hotel_categories.dart';
import 'package:api_new/model/hotel_likeDislike.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/hotel.dart';
import '../model/hotel_policies.dart';
import 'nearby_places.dart';

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
    print('Raw JSON data: $body');

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
        address: e['address'],
        lat: e['lat'],
        lng: e['lng'],
        starRate: e['starRate'],
        roomRate: e['roomRate'],
        id: e['id'],
        profilePicture: e['profilePicture'],
        images: List<String>.from(e["images"].map((x) => x)),
        amenities: List<String>.from(e["amenities"].map((x) => x)),
        policies: List<String>.from(e["policies"].map((x) => x)),
        // policies: HotelPolicies.fromJson(e['policies'] ?? {}),
        // policies: .fromJson(e['policies'] ?? {}),
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

  static Future<List<Place>> fetchNearbyPlaces(
      double latitude, double longitude) async {
    const apiKey = 'AIzaSyC669bNf39Uaq3R3Ns8Wol7RaynIO-_n94';
    const radius = 1000; // Example radius in meters
    const placeType = 'restaurant'; // Example place type

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        '&location=$latitude,$longitude'
        '&radius=$radius'
        '&types=$placeType'
        '&key=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodeDate = json.decode(response.body);
      final places = (decodeDate['results'] as List<dynamic>).map((placeData) {
        return Place(
          name: placeData['name'],
          latitude: placeData['lat'],
          longitude: placeData['lng'],
          address: '',
        );
      }).toList();
      return places;
    } else {
      throw Exception('Failed to load nearby places');
    }
  }
}

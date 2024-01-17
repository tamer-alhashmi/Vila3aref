import 'dart:convert';
import 'package:api_new/services/hotels_apis.dart';
import 'package:http/http.dart' as http;

Future<void> getNearbyPlaces(double latitude, double longitude) async {
  const apiKey = 'AIzaSyC669bNf39Uaq3R3Ns8Wol7RaynIO-_n94';
  const radius = 500; // Example radius in meters
  const placeType = 'restaurant'; // Example place type

  final url =
      Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
          'location=$latitude,$longitude'
          '&radius=$radius'
          '&types=$placeType'
          '&key=$apiKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body);
    // Parse and use the data as needed
    print(decodedData);
  } else {
    // Handle error
    print('Error: ${response.statusCode}');
  }
}

class Place {
  final String name;
  final double latitude;
  final double longitude;
  final String address;

  Place({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
  });
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
      };

  // factory Place.fromJson(Map<String, dynamic> json) {
  //   return Place(
  //     name: json['name'] ?? '',
  //     latitude: json['geometry']['location']['lat'] ?? 0.0,
  //     longitude: json['geometry']['location']['lng'] ?? 0.0,
  //     address: json['vicinity'] ?? '',
  //   );
  // }
}

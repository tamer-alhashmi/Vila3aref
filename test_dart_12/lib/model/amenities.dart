import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';
// import 'hotel_categories.dart';

class HotelAmenities extends StatelessWidget {
  final List<String> amenities;

  const HotelAmenities(
      {Key? key, required this.amenities, required Hotel hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amenities:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: amenities.map((amenity) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('- $amenity'),
            );
          }).toList(),
        ),
      ],
    );
  }
}

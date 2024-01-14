import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
// import 'hotel_categories.dart';

class HotelAmenities extends StatelessWidget {
  final List<String> amenities;
  final Hotel hotel;

  const HotelAmenities({Key? key, required this.amenities, required this.hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hotel.amenities.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Most Popular Facilities:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: hotel.amenities.map((amenity) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Chip(
                    label: Text(amenity),
                    labelStyle: const TextStyle(
                      fontSize: 14, // Customize text size
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Customize border radius
                      side: const BorderSide(
                        color: AppTheme
                            .buiColorCtaBackground, // Customize border color
                        width: 0.5, // Customize border width
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

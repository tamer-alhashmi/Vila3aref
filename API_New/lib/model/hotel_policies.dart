import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
// import 'hotel_categories.dart';

class HotelPolicies extends StatelessWidget {
  final List<String> policies;
  final Hotel hotel;

  const HotelPolicies({Key? key, required this.policies, required this.hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          children: hotel.policies.map((amenity) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Chip(
                label: Text(amenity),
                labelStyle: const TextStyle(
                  fontSize: 14, // Customize text size
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Customize border radius
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
    );
  }
}

// class HotelPolicies {
//   final String checkIn;
//   final String checkOut;
//   final String accommodationType;
//   final String petPolicy;
//
//   HotelPolicies({
//     required this.checkIn,
//     required this.checkOut,
//     required this.accommodationType,
//     required this.petPolicy,
//   });
//
//   factory HotelPolicies.fromJson(Map<String, dynamic> json) => HotelPolicies(
//         checkIn: json["Check in"],
//         checkOut: json["Check out"],
//         accommodationType: json["Accommodation Type"],
//         petPolicy: json["Pet Policy"],
//       );
//
//   Map<String, String> asMap() {
//     return {
//       'Check in': checkIn,
//       'Check out': checkOut,
//       "Accommodation Type": accommodationType,
//       "Pet Policy": petPolicy,
//       // ... map other policy properties ...
//     };
//   }
//
//   Map<String, String> map() {
//     return {
//       'Check in': checkIn,
//       'Check out': checkOut,
//       "Accommodation Type": accommodationType,
//       "Pet Policy": petPolicy,
//       // ... map other policy properties ...
//     };
//   }
// }

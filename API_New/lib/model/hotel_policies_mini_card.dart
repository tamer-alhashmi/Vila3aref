import 'package:api_new/model/hotel.dart';
import 'package:api_new/model/hotel_policies.dart';
import 'package:flutter/material.dart';

class PoliciesMiniCard extends StatelessWidget {
  final Hotel hotel;
  const PoliciesMiniCard(
      {Key? key, required this.hotel, required HotelPolicies policies})
      : super(key: key);

  // get checkIn => HotelPolicies;
  // get checkOut => HotelPolicies;
  // get accommodationType => HotelPolicies;
  // get petPolicy => HotelPolicies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Policies',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Adjust the spacing as needed
        // Text(
        //   hotel.policies.policies.entries.map((entry) {
        //     return '(${entry.key}): ${entry.value}';
        //   }).join('\n'),
        //   // maxLines: 3, // Adjust the maximum number of lines
        //   // overflow: TextOverflow.ellipsis,
        //   style: const TextStyle(
        //     fontSize: 14,
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}

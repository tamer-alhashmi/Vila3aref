import 'package:api_new/model/hotel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionMiniCard extends StatelessWidget {
  const DescriptionMiniCard(
      {Key? key, required this.hotel, required String description})
      : super(key: key);
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Adjust the spacing as needed
        Text(
          hotel.description,
          maxLines: 3, // Adjust the maximum number of lines
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

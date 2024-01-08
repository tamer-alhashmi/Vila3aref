import 'package:api_new/model/hotel.dart';
import 'package:api_new/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewsBox extends StatelessWidget {
  const ReviewsBox({super.key, required this.hotel});

  final Hotel hotel;
  String get starRate => hotel.starRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.lightPrimaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomRight: Radius.circular(6)),
      ),
      child: Center(
        child: Text(
            starRate,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

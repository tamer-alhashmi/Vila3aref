
// import 'package:apireset2/model/hotel_categories.dart';
// import 'package:apireset2/model/hotel_likeDislike.dart';
import 'package:flutter_svg/svg.dart';

const String starIcon = 'assets/images/ant-design_star-filled.svg';
const String redHeartSVG = 'assets/images/red_heart_SVG.svg';
class Hotel {
  final String name;
  final String reception;
  final String description;
  final String location;
  final String roomRate;
  final String starRate;
  final int id;
  final String profilePicture;
  // final LikeDisLike likeDislike;
  // final String categories;
  // final String amenities;

  Hotel({
    required this.name,
    required this.reception,
    required this.description,
    required this.location,
    required this.starRate,
    required this.roomRate,
    required this.id,
    required this.profilePicture,
    // required this.categories,
    // required this.likeDislike,
    // required this.amenities,

  });
}

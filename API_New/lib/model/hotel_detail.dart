import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:api_new/model/hotel.dart';

class HotelDetail extends StatefulWidget {
  final Hotel hotel;

  const HotelDetail({super.key, required this.hotel});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Implement menu functionality
              },
            ),
          ],
        ),
        body: Column(children: [
          Container(
            width: 400,
            height: 246,
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: PageView.builder(
                itemCount: widget.hotel.images.length,
                // Assuming pictures is a list of image paths
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.hotel.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          ),
          // Aminties

          // Hotel details
          // ... Implement your hotel details UI here

          // Button to book
          ElevatedButton(
            onPressed: () {
              // Implement booking functionality
            },
            child: const Text('Book Now'),
          ),
        ]));
  }
}

//
// Container(
// width: 375,
// height: 812,
// clipBehavior: Clip.antiAlias,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(24),
// ),
// ),
// child: Stack(
// children: [
// Positioned(
// left: 24,
// top: 636,
// child: Container(
// width: 98,
// height: 82,
// clipBehavior: Clip.antiAlias,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 98,
// height: 82,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(profilePicture as String),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 138,
// top: 636,
// child: Container(
// width: 98,
// height: 82,
// clipBehavior: Clip.antiAlias,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 98,
// height: 82,
// decoration:  BoxDecoration(
// image: DecorationImage(
// image: AssetImage(profilePicture as String),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 252,
// top: 636,
// child: Container(
// height: 82,
// clipBehavior: Clip.antiAlias,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 112,
// height: 92,
// decoration:  BoxDecoration(
// image: DecorationImage(
// image: AssetImage(profilePicture as String),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 728,
// child: Container(
// width: 327,
// padding: const EdgeInsets.all(16),
// decoration: ShapeDecoration(
// color: const Color(0xFF4C4DDC),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12),
// ),
// ),
// child: const Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text(
// 'Booking Now',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.white,
// fontSize: 14,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.11,
// ),
// ),
// ],
// ),
// ),
// ),
// const Positioned(
// left: 24,
// top: 607,
// child: Text(
// 'Preview',
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 14,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.11,
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 590,
// child: Container(
// width: 79,
// decoration: const ShapeDecoration(
// shape: RoundedRectangleBorder(
// side: BorderSide(
// width: 1,
// strokeAlign: BorderSide.strokeAlignCenter,
// color: Color(0xFFEDEDED),
// ),
// ),
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 504,
// child: Container(
// child: const Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Description',
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 14,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.11,
// ),
// ),
// SizedBox(height: 12),
// SizedBox(
// width: 327,
// child: Text.rich(
// TextSpan(
// children: [
// TextSpan(
// text: 'name',
// style: TextStyle(
// color: Color(0xFF878787),
// fontSize: 12,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.12,
// ),
// ),
// TextSpan(
// text: 'description',
// style: TextStyle(
// color: Color(0xFF878787),
// fontSize: 12,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w400,
// height: 0.12,
// ),
// ),
// TextSpan(
// text: 'Read More. . .',
// style: TextStyle(
// color: Color(0xFF4C4DDC),
// fontSize: 12,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.12,
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 470,
// child: Container(
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 18,
// height: 18,
// child: const Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// // Container(
// //   width: 18,
// //   height: 18,
// //   child: Row(
// //     mainAxisSize: MainAxisSize.min,
// //     mainAxisAlignment: MainAxisAlignment.center,
// //     crossAxisAlignment: CrossAxisAlignment.center,
// //     children: [
// //       Container(
// //         width: 18,
// //         height: 18,
// //         child: const Stack(children: [
// //
// //             ]),
// //       ),
// //     ],
// //   ),
// // ),
// ],
// ),
// ),
// const SizedBox(width: 8),
// const Text(
// 'hotelsss',
// style: TextStyle(
// color: Color(0xFF878787),
// fontSize: 12,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w400,
// height: 0.12,
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 438,
// child: Container(
// child: const Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'name',
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 16,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.09,
// ),
// ),
// SizedBox(width: 73),
// SizedBox(
// width: 105,
// child: Text.rich(
// TextSpan(
// children: [
// TextSpan(
// text: 'roomRate',
// style: TextStyle(
// color: Color(0xFF4C4DDC),
// fontSize: 16,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 1.2,
// ),
// ),
// TextSpan(
// text: '555 ',
// style: TextStyle(
// color: Color(0xFF4C4DDC),
// fontSize: 14,
// fontFamily: 'Inter',
// // fontWeight: FontWeight.w700,
// height: 1.5,
// ),
// ),
// TextSpan(
// text: '/night',
// style: TextStyle(
// color: Color(0xFF878787),
// fontSize: 14,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w500,
// height: 0.11,
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 386,
// child: Container(
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// height: 36,
// padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color(0xB2F5F5FF),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: const Stack(children: [
//
// ]),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// const SizedBox(width: 8),
// const Expanded(
// child: SizedBox(
// child: Text(
// 'Free Wifi',
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 12,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w500,
// height: 0.12,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// const SizedBox(width: 8),
// Container(
// height: 36,
// padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color(0xB2F5F5FF),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: const Stack(children: [
//
// ]),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// const SizedBox(width: 8),
// const Expanded(
// child: SizedBox(
// child: Text(
// 'Free Breakfast',
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 12,
// // fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w500,
// height: 0.12,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// const SizedBox(width: 8),
// Container(
// height: 36,
// padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color(0xB2F5F5FF),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// clipBehavior: Clip.antiAlias,
// decoration: const BoxDecoration(),
// child: const Stack(children: [
//
// ]),
// ),
// const SizedBox(width: 8),
// const SizedBox(
// width: 24,
// child: Text(
// hotel = Hot.roomRate,
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 12,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w500,
// height: 0.12,
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 124,
// child: Container(
// width: 327,
// height: 246,
// clipBehavior: Clip.antiAlias,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// ),
// child: Stack(
// children: [
// Positioned(
// left: -159,
// top: 0,
// child: Container(
// width: 487,
// height: 310,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: NetworkImage("https://via.placeholder.com/487x310"),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ),
// Positioned(
// left: 283,
// top: 12,
// child: Container(
// width: 32,
// height: 32,
// padding: const EdgeInsets.all(6),
// clipBehavior: Clip.antiAlias,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(100),
// ),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 20,
// height: 20,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// width: 16.67,
// height: 15.83,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: NetworkImage("https://via.placeholder.com/17x16"),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 24,
// top: 44,
// child: Container(
// width: 327,
// padding: const EdgeInsets.symmetric(vertical: 12),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// padding: const EdgeInsets.all(8),
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(
// side: const BorderSide(width: 1, color: Color(0xFFEDEDED)),
// borderRadius: BorderRadius.circular(8),
// ),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// width: 24,
// height: 24,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 24,
// height: 24,
// padding: const EdgeInsets.symmetric(vertical: 5),
// child:  Container(
// width: 370,
// height: 259,
// // decoration: const BoxDecoration(
// //   image: DecorationImage(
// //     image: AssetImage('profilePicture'
// //     ),
// //     fit: BoxFit.fill,
// //   ),
// // ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// const Text(
// 'Detail',
// style: TextStyle(
// color: Color(0xFF0F0F0F),
// fontSize: 16,
// fontFamily: 'Plus Jakarta Sans',
// fontWeight: FontWeight.w700,
// height: 0.09,
// ),
// ),
// Container(
// padding: const EdgeInsets.all(8),
// decoration: ShapeDecoration(
// shape: RoundedRectangleBorder(
// side: const BorderSide(width: 1, color: Color(0xFFEDEDED)),
// borderRadius: BorderRadius.circular(8),
// ),
// ),
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// width: 24,
// height: 24,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 24,
// height: 24,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 24,
// height: 24,
// child: const Stack(children: [
//
// ]),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// left: 0,
// top: 778,
// child: Container(
// width: 375,
// height: 34,
// child: Stack(
// children: [
// Positioned(
// left: 0,
// top: 0,
// child: Container(width: 375, height: 34),
// ),
// Positioned(
// left: 121,
// top: 19,
// child: Container(
// width: 134,
// height: 5,
// decoration: ShapeDecoration(
// color: const Color(0xD8344054),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(2.50),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// )

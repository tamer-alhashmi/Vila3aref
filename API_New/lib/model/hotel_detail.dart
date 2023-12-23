import 'dart:async';

import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';

class HotelDetail extends StatefulWidget {
  final Hotel hotel;
   const HotelDetail({super.key, required this.hotel});


  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    // Set up an auto-play timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.hotel.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  void dispose() {
    // Dispose of the controller and timer to avoid memory leaks
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView.builder(
                itemCount: widget.hotel.images.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  print("Images length : ${widget.hotel.images.length}");
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index]}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}























// import 'package:api_new/model/hotel_loading.dart';
// import 'package:api_new/model/hotel.dart';
// import 'package:flutter/material.dart';
//
//
//
// class HotelDetail extends StatefulWidget {
//   final Hotel hotel;
//
//   const HotelDetail({super.key, required this.hotel});
//
//   @override
//   State<HotelDetail> createState() => _HotelDetailState();
// }
//
// class _HotelDetailState extends State<HotelDetail> {
//
//   Future<void> fetchHotel() async {
//     // Your fetch hotel logic here
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               // Implement menu functionality
//             },
//           ),
//         ],
//       ),
//       body:  SingleChildScrollView(
//         child: Column(
//           children: [
//             //Slider for hotel picture
//             Container(
//               height: 300,
//               child: PageView.builder(
//                 itemCount: widget.hotel.images.length,
//                 controller: PageController(
//                   initialPage: 0,
//                   viewportFraction: 0.85,
//               ),
//                 itemBuilder: (context, index){
//                   return Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                   decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   image: DecorationImage(
//                   image: AssetImage('assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index]}'),
//     );
//     ]
//         )
//       ),
//     );
//   }
// }






// SingleChildScrollView(
// child: Column(
// children: [
// // Slider for hotel pictures
// Container(
// height: 200, // Set the height of your slider
// child: PageView.builder(
// itemCount: widget.hotel.images.length * 2, // Make it double the length for a continuous loop
// controller: PageController(
// initialPage: widget.hotel.images.length * 2 ~/ 2, // Start from the middle for a continuous loop
// viewportFraction: 0.85, // Adjust the fraction as needed
// ),
// itemBuilder: (context, index) {
// return Container(
// margin: const EdgeInsets.fromLTRB(10, 10, 10, 0 ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8.0),
// image: DecorationImage(
// image: AssetImage(
//
// 'assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index % widget.hotel.images.length]}',
// ),
// fit: BoxFit.cover,
// ),
// ),
// );
// },
// ),
// ),
//
// // ... Other details of the hotel
//
// // Button to book
// ElevatedButton(
// onPressed: () {
// // Implement booking functionality
// },
// child: const Text('Book Now'),
// ),
// ],
// ),
// )
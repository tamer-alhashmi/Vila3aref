// import 'dart:async';
// import 'package:page_view_indicators/page_view_indicators.dart';
//
// import 'package:api_new/model/hotel.dart';
// import 'package:flutter/material.dart';
//
// class HotelDetail extends StatefulWidget {
//   final Hotel hotel;
//    const HotelDetail({super.key, required this.hotel});
//
//
//   @override
//   State<HotelDetail> createState() => _HotelDetailState();
// }
//
// class _HotelDetailState extends State<HotelDetail> {
//    late PageController _pageController;
//   late ValueNotifier<int> _currentPageNotifier;
//   late Timer _timer;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(
//       initialPage: 0,
//       viewportFraction: 0.85,
//     );
//     _currentPageNotifier = ValueNotifier<int>(0);
//     // Set up an auto-play timer
//     _timer = Timer.periodic( const Duration(seconds: 3), (Timer timer) {
//       if (_currentPage < widget.hotel.images.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//         // Jump to the first page without animation to create a loop effect
//         _pageController.jumpToPage(0);
//       }
//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     });
//   }
//   @override
//   void dispose() {
//     // Dispose of the controller and timer to avoid memory leaks
//     _pageController.dispose();
//     _timer.cancel();
//     _currentPageNotifier.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               child: Stack(
//                 children: <Widget>[PageView.builder(
//                   itemCount: widget.hotel.images.length,
//                   controller: _pageController,
//                   onPageChanged: (int index) {
//                     _currentPageNotifier.value = index;
//                   },
//                   itemBuilder: (context, index) {
//                     print("Images length : ${widget.hotel.images.length}");
//                     return Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index]}'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     );
//                   },
//                 )],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Container(
//   // child: Positioned(
//   //  bottom: 16.0,
//   //  left: 0,
//   //  right: 0,
//   //  child: PageViewIndicator(
//   //    controller: _pageController,
//   //    notifier: _currentPageNotifier,
//   //    itemCount: widget.hotel.images.length,
//   //    color: Colors.grey,
//   //    activeColor: Colors.blue,
//   //    size: 8.0,
//   //    space: 12.0,
//   //  ),
//   //               ),
// ),

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
import 'package:api_new/model/Reviews_Box.dart';
import 'package:api_new/model/icons.dart';
import 'package:api_new/theme/app_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import 'dart:async';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key, required this.hotel});
  final Hotel hotel;

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  // late List<Hotel> hotel = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Set up an auto-play timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.hotel.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
        // Jump to the first page without animation to create a loop effect
        // _pageController.jumpToPage(0);
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
    String name = widget.hotel.name;
    int id = widget.hotel.id;
    int discount = (widget.hotel.discount).toString() as int;
    String description = widget.hotel.description;
    String location = widget.hotel.location;
    String starRate = widget.hotel.starRate;
    String roomRate = widget.hotel.roomRate;
    String profilePicture = widget.hotel.profilePicture;
    List<String> images = widget.hotel.images;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'H&H HOTELS',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.7,
            // fontFamily: 'Kalnia',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ), //notifications
        ],
        backgroundColor: AppTheme.lightPrimaryColor,
        leading: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.menu)), //Icons.menu
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
        )),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                // Hotel name
                '$name Hotel',
                style: TextStyle(
                  color: const Color(0xFF0F0F0F),
                  fontSize: 20,
                  fontFamily: GoogleFonts.almarai().fontFamily,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ), // Hotel name
              // const SizedBox(width: 8),
              ReviewsBox(hotel: widget.hotel),
            ], // Name & Star
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      PageView.builder(
                        itemCount: widget.hotel.images.length,
                        controller: _pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index]}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    child: PageViewDotIndicator(
                      currentItem: _currentPage,
                      unselectedColor: Colors.black26,
                      selectedColor: Colors.black54,
                      count: widget.hotel.images.length,
                      size: const Size(12, 12),
                      unselectedSize: const Size(8, 8),
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      fadeEdges: false,
                      // boxShape: BoxShape.circle, //defaults to circle
                      // borderRadius: BorderRadius.circular(5),

                      //only for rectangle shape
                      // onItemClicked: (index) { }
                    ),
                  ),
                ) // Dots
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text('$discount, off'),
                const Text(
                    "Economic"
                )
              ],
            ),
          )// Dots...
        ],
      ),
    );
  }
}

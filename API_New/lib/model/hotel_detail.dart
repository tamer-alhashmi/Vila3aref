import 'package:api_new/model/hotel_map_address.dart';
import 'package:api_new/model/hotel_nearby_places.dart';
import 'package:api_new/model/reviews_box.dart';
import 'package:api_new/model/date_selection_widget.dart';
import 'package:api_new/model/scrollup.dart';
import 'package:api_new/model/user_rooms_adoult_child_selected.dart';
import 'package:api_new/services/hotels_apis.dart';
import 'package:api_new/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'dart:async';
import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';
import 'amenities.dart';
import 'bottom_navigate_bar.dart';
import 'hotel_description_mini.dart';
import 'hotel_policy_widget.dart';

class HotelDetail extends StatefulWidget {
  HotelDetail({Key? key, required this.hotel}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final Hotel hotel;
  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  int _nights = 0; // Added variable to store nights
  int _userRoomSelected = 1;
  int _userAdultSelected = 1;
  int _userChildrenSelected = 0;
  get scrollController => CustomFloatingActionButton;

  // late List<Hotel> hotel = [];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
    fetchNearbyPlaces(widget.hotel.lat, widget.hotel.lng);
  }

  Future<void> fetchNearbyPlaces(double latitude, double longitude) async {
    try {
      final nearbyPlaces =
          await HotelsApi.fetchNearbyPlaces(latitude, longitude);
      // Handle the list of nearby places as needed
      print(nearbyPlaces);
    } catch (e) {
      // Handle errors
      print('Error fetching nearby places: $e');
    }
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
    ScrollController scrollController = ScrollController();
    String name = widget.hotel.name;
    int id = widget.hotel.id;
    int discount = widget.hotel.discount;
    String description = widget.hotel.description;
    String address = widget.hotel.address;
    String city = widget.hotel.city;
    String starRate = widget.hotel.starRate;
    String roomRate = widget.hotel.roomRate;
    String profilePicture = widget.hotel.profilePicture;
    List<String> images = widget.hotel.images;
    List<String> amenities = widget.hotel.amenities;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'H&H HOTELS',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.7,
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
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: const Icon(Icons.arrow_back)), //Icons.menu
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
          bottomRight: Radius.circular(6),
        )),
      ),
      bottomNavigationBar: const CustomBottomBar(bottomAppBar: BottomAppBar()),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Slider
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
            //Slider & Dots...
            Column(
              children: [
                SizedBox(
                  height: 210,
                  width: double.infinity,
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
                                    'assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index] ?? "assets/images/${widget.hotel.name}/Alumhurst1.png"}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ), //Slider
                Center(
                  child: Container(
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
            //  Economic Discount
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$discount % off',
                        style: const TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xffbbdefb),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 1, bottom: 1, left: 3, right: 3),
                          child: Text(
                            "Economic Discount",
                            style: TextStyle(
                              // backgroundColor: Colors.tealAccent,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ) // Economic Discount
                    ],
                  ),
                ), //10% Economic Discount
                Padding(
                  //Price for $_nights
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Row(
                    children: [
                      // Price for nights
                      Text(
                        'Price for ${_nights > 0 ? '$_nights nights' : '1 night'}, 2 adults',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ), //Price for ${_nights
                Row(children: [
                  Text(
                      // Price after Discount
                      _nights > 0
                          ? '£${_nights * double.parse(roomRate)}'
                          : '£${double.parse((roomRate))}',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationColor:
                              Colors.red)), // Display price before discount
                  Text(
                    // Total Price
                    _nights > 0
                        ? '  :  £${(_nights * double.parse(roomRate) * (1 - discount / 100)).toStringAsFixed(2)}'
                        : '  :  £${(double.parse(roomRate) * (1 - discount / 100)).toStringAsFixed(2)}',
                  ),
                  // Calculate and display total price
                ]),

                const Row(
                  children: [
                    Text('Includes taxes and fees'),
                  ],
                )
              ],
            ),
            DateSelectionWidget(
              hotel: widget.hotel,
              onDatesSelected: (checkInDate, checkOutDate, nights) {
                // Calculate nights here
                setState(() {
                  _nights = nights;
                });
              },
            ),
            RoomsAndGuestsSelector(
              onSelectionChanged: (rooms, adults, children) {
                setState(() {
                  _userRoomSelected = rooms;
                  _userAdultSelected = adults;
                  _userChildrenSelected = children;
                });
              },
              hotel: widget.hotel,
            ),
            HotelMapLocation(
              hotel: widget.hotel,
            ),
            HotelAmenities(
              amenities: widget.hotel.amenities,
              hotel: widget.hotel,
            ),
            DescriptionMiniCard(
              description: widget.hotel.description,
              hotel: widget.hotel,
            ),
            HotelPoliciesWidget(
              policies: widget.hotel.policies, hotel: widget.hotel,
              // hotel: widget.hotel,
            ),
            NearbyPlacesWidget(
              nearbyPlaces: widget.hotel.nearbyPlaces,
              hotel: widget.hotel,
            ),
          ]),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        scrollController: scrollController,
      ),
    );
  }
}

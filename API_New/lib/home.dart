// import 'package:apireset2/model/hotel_likeDislike.dart';
import 'package:api_new/model/bottom_navigate_bar.dart';
import 'package:api_new/model/hotel.dart';
import 'package:api_new/model/hotel_detail.dart';
import 'package:api_new/model/icons.dart';
import 'package:api_new/model/scrollup.dart';
import 'package:api_new/services/hotels_apis.dart';
import 'package:api_new/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController = ScrollController();

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  late List<Hotel> hotels = [];

  get scrollController => CustomFloatingActionButton;

  // this override to call data
  @override
  void initState() {
    super.initState();
    fetchHotel();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'H&H HOTELS',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.7,
            fontFamily: 'Kalnia',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppTheme.lightPrimaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: Colors.blue,
                  child: const Column(
                    children: [Text('H&H Hotel')],
                  ),
                )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Shop'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () {},
            ),
          ],
        ),
      ),

      bottomNavigationBar: const CustomBottomBar(
          bottomAppBar: BottomAppBar()), //bottom Navigation Bar
      body: Visibility(
        visible: true,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Padding(
          // Search area
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search by location
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Search by location',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              // Add some spacing between text fields

              // Search by city
              Container(
                child: TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Search by city',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      print('Building hotel item $index');
                      final hotel = hotels[index];
                      var name = hotel.name;
                      final id = hotel.id;
                      final description = hotel.description;
                      // final reception = hotel.reception;
                      final location = hotel.location;
                      final roomRate = hotel.roomRate;
                      final starRate = hotel.starRate;
                      final profilePicture = hotel.profilePicture;
                      final redHeartPathIcon = getRedHeartSVGPath();
                      final starRateIcon = getStarRateSVGPath();
                      final arrowIcon = getArrowSVGPath();
                      final blueHearIcon = getBlueHeartSVGPath();
                      final coffeeIcon = getCoffeeSVGPath();
                      final locationIcon = getLocationSVGPath();
                      final moreIcon = getMoreSVGPath();
                      final wifiIcon = getWifiSVGPath();
                      // String roomRateValue =
                      //     double.parse(roomRate) as String;

                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 370,
                        height: 327,
                        child: Column(
                          children: [
                            // Search area
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HotelDetail(hotel: hotel)),
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 370,
                                    height: 209,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 370,
                                          height: 259,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(profilePicture),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ), // Profile Picture
                                        Positioned(
                                          right: 13,
                                          top: 12,
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            padding: const EdgeInsets.all(6),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                          width: 20,
                                                          height: 20,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Stack(children: [
                                                            SvgPicture.asset(
                                                                redHeartPathIcon,
                                                                semanticsLabel:
                                                                    'A redHear')
                                                          ])),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ), // Red Heart widget
                                      ],
                                    ), // Profile picture
                                  ),
                                  Container(
                                    width: 370,
                                    height: 118,
                                    padding: const EdgeInsets.all(12),
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x0F121212),
                                          blurRadius: 16,
                                          offset: Offset(4, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                // Hotel name
                                                name,
                                                style: const TextStyle(
                                                  color: Color(0xFF0F0F0F),
                                                  fontSize: 14,
                                                  fontFamily: 'Plus Jakarta Sans',
                                                  fontWeight: FontWeight.w700,
                                                  height: 1,
                                                ),
                                              ), // Hotel name
                                              // const SizedBox(width: 50),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: Stack(children: [
                                                      SvgPicture.asset(
                                                          starRateIcon,
                                                          semanticsLabel:
                                                              'Star Rate')
                                                    ]),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    starRate.toString(),
                                                    style: const TextStyle(
                                                      color: Color(0xFF0F0F0F),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.12,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ], // Name & Star
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: 300,
                                          height: 30,
                                          child: Text(
                                            location,
                                            style: const TextStyle(
                                              color: Color(0xFF878787),
                                              fontSize: 12,
                                              // fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 1.1,
                                            ),
                                          ),
                                        ), //location
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            width: double.infinity,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '£$roomRate',
                                                    style: const TextStyle(
                                                      color: Color(0xFF4C4DDC),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.11,
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                    text: ' / night',
                                                    style: TextStyle(
                                                      color: Color(0xFF878787),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ), //Room Rate
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: CustomFloatingActionButton(
        scrollController: scrollController,
      ),
    );
  }

  Future<void> fetchHotel() async {
    final response = await HotelsApi.fetchHotel();
    setState(() {
      hotels = response;
    });
  }
}

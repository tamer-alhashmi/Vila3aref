// import 'package:apireset2/model/hotel_likeDislike.dart';
import 'package:api_new/model/hotel.dart';
import 'package:api_new/model/hotel_detail.dart';
import 'package:api_new/services/hotels_apis.dart';
import 'package:api_new/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  late List<Hotel> hotels;

  // this override to call data
  @override
  void initState() {
    super.initState();
    fetchHotel();
  }

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.menu)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          // shape: BoxShadow(
          //   color =  Color(_kColorDefault),
          //   offset = Offset.zero,
          //   spreadRadius = 0.0,
          //   blurStyle = BlurStyle.normal,),
          // color: Colors.white,
          // border: Border(
          //     top: BorderSide(
          //         color: AppTheme.lightAccentColor,
          //         width: 0.5))
        ),
        child: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          snakeViewColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 5),
          // selectedItemColor: Colors.white,
          // selectedLabelStyle: const TextStyle(
          //   color: Colors.white,
          // ),
          // showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            color: AppTheme.buiColorCtaBackground,
          ),
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          //Theme.of(context).colorScheme.secondary,
          showUnselectedLabels: true,
          currentIndex: 0,
          onTap: (val) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account'),
          ],
        ),
      ), //bottom Navigation Bar
      body: Padding(
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
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Search by city',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = hotels[index];
                    var name = hotel.name;
                    final id = hotel.id;
                    final description = hotel.description;
                    final reception = hotel.reception;
                    final location = hotel.location;
                    final starRate = hotel.starRate;
                    final roomRate = hotel.roomRate;
                    final profilePicture = hotel.profilePicture;
                    SvgPicture svgIcon;
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
                                                          svgIcon = SvgPicture.asset(
                                                              redHeartSVG,
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
                                                    svgIcon = SvgPicture.asset(
                                                        starIcon,
                                                        semanticsLabel:
                                                            'A yallow star'),
                                                  ]),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  starRate,
                                                  style: const TextStyle(
                                                    color: Color(0xFF0F0F0F),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
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
                                                  text: roomRate,
                                                  style: const TextStyle(
                                                    color: Color(0xFF4C4DDC),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w700,
                                                    height: 0.11,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: '/night',
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

      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchHotel,
      //   backgroundColor: Colors.teal, // Set the background color
      //   foregroundColor: Colors.white, // Set the icon color
      //   elevation: 5.0,
      //   child: const Icon(Icons.arrow_forward,
      //     size: 30.0,
      //       semanticLabel: 'FetchUser',
      //   ), // Set the shadow elevation
      //   ),
    );
  }

  Future<void> fetchHotel() async {
    final response = await HotelsApi.fetchHotel();
    setState(() {
      hotels = response;
    });
  }
}

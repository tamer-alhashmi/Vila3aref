import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'hotel.dart';

class HotelMapLocation extends StatelessWidget {
  const HotelMapLocation({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;
  get name => hotel.name;

  @override
  Widget build(BuildContext context) {
    String location = hotel.address;
    String city = hotel.city;
    // Assuming you have a LatLng for the hotel location, replace LatLng(0, 0) with the actual coordinates.
    LatLng hotelLatLng = LatLng(hotel.lat, hotel.lng);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$name Hotel location',
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280, // Specify the desired height for the map
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: hotelLatLng,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('hotelMarker'),
                position: hotelLatLng,
                infoWindow: InfoWindow(
                  title: '$city - $location',
                ),
              ),
            },
          ),
        ),
        // Text('$city - $location'),
      ],
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'hotel.dart';
//
//
// class HotelMap  extends StatelessWidget {
//
//
//
//   const HotelMap ({super.key, required this.hotel});
//   final Hotel hotel;
//   String get location => hotel.location;
//
//   @override
//   Widget build(BuildContext context) {
//     String location = hotel.location;
//     String city = hotel.city;
//     return  Expanded(
//        child: Column(
//         children: [
//           const Text('Property location',
//           style: TextStyle(
//             fontSize: 16
//           ),),
//           //Map here
//           Text(
//            '$city - $location'
//           )
//         ],
//       ),
//     );
//   }
// }

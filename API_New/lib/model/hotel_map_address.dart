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
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$name Hotel location',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                zoom: 12.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('hotelMarker'),
                  position: hotelLatLng,
                  infoWindow: InfoWindow(
                    title: '$name Hotel',
                    snippet: '$city - $location',
                  ),
                ),
              },
            ),
          ),
          // Text('$city - $location'),
        ],
      ),
    );
  }
}

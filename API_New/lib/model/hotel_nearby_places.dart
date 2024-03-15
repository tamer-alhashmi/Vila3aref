import 'package:api_new/services/nearby_places.dart';
import 'package:flutter/material.dart';
import 'package:api_new/model/hotel.dart';

class NearbyPlacesWidget extends StatelessWidget {
  final List<Place>? nearbyPlaces;

  const NearbyPlacesWidget({Key? key, this.nearbyPlaces, required Hotel hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nearby Places:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        if (nearbyPlaces != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: nearbyPlaces!.map((place) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(place.name),
              );
            }).toList(),
          ),
        if (nearbyPlaces == null) const Text('No nearby places available'),
      ],
    );
  }
}

// class HotelNearbyPlaces extends StatelessWidget {
//   final Hotel hotel;
//
//   const HotelNearbyPlaces(
//       {Key? key, required this.hotel, required nearbyPlaces})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Nearby Places:',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         FutureBuilder(
//           future: HotelsApi.fetchNearbyPlaces(hotel.lat, hotel.lng),
//           builder: (context, AsyncSnapshot<List<Place>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Text('No nearby places found.');
//             } else {
//               // Present the list of nearby places
//               return Column(
//                 children: snapshot.data!.map((place) {
//                   return ListTile(
//                     title: Text(place.name),
//                     subtitle: Text(place.address),
//                     // You can customize how each nearby place is presented
//                   );
//                 }).toList(),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

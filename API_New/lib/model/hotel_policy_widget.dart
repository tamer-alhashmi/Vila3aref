// import 'package:flutter/material.dart';
//
// import 'hotel.dart';
// import 'hotel_policies.dart';
//
// class HotelPoliciesWidget extends StatelessWidget {
//   final Hotel hotel;
//   final HotelPolicies policies;
//
//   const HotelPoliciesWidget({Key? key, required this.policies, this.hotel})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Policies:',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 4),
//               child: Text('Check in: ${policies.checkIn}'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 4),
//               child: Text('Check out: ${policies.checkOut}'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 4),
//               child: Text('Accommodation Type: ${policies.accommodationType}'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 4),
//               child: Text('Pet Policy: ${policies.petPolicy}'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

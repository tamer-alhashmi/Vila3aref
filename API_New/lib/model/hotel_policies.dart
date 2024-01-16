import 'package:flutter/material.dart';

class HotelPoliciesWidget extends StatelessWidget {
  final Map<String, dynamic> policies;

  const HotelPoliciesWidget({Key? key, required this.policies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Policies:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: policies.entries.map((entry) {
            final key = entry.key;
            final value = entry.value?.toString() ?? 'N/A';
            print('Key: $key, Value: $value'); // Add this line
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('$key: $value'),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// class HotelPoliciesWidget extends StatelessWidget {
//   final Map<String, dynamic> policies;
//
//   const HotelPoliciesWidget({Key? key, required this.policies})
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
//           children: policies.entries.map((entry) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 4),
//               child: Text(
//                   '${entry.key}: ${entry.value.toString()}'), // Display both key and value
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }

class HotelPolicies {
  final String checkIn;
  final String checkOut;
  final String accommodationType;
  final String petPolicy;

  HotelPolicies({
    required this.checkIn,
    required this.checkOut,
    required this.accommodationType,
    required this.petPolicy,
  });

  factory HotelPolicies.fromJson(Map<String, dynamic> json) {
    return HotelPolicies(
      checkIn: json['Check in'] ?? '',
      checkOut: json['Check out'] ?? '',
      accommodationType: json['Accommodation Type'] ?? '',
      petPolicy: json['Pet Policy'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "Check in": checkIn,
        "Check out": checkOut,
        "Accommodation Type": accommodationType,
        "Pet Policy": petPolicy,
      };
}

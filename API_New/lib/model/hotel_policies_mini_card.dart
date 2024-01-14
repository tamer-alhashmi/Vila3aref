import 'package:flutter/cupertino.dart';

class PoliciesMiniCard extends StatelessWidget {
  const PoliciesMiniCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Policies',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Adjust the spacing as needed
        Text(
          hotel.policies,
          maxLines: 3, // Adjust the maximum number of lines
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

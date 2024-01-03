
import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';
class RoomsAndGuestsSelector extends StatefulWidget {
  const RoomsAndGuestsSelector ({super.key, required Hotel hotel, required this.onSelectionChanged });
final Function(int, int, int) onSelectionChanged;
  @override
  _RoomsAndGuestsSelectorState createState() => _RoomsAndGuestsSelectorState();
}

class _RoomsAndGuestsSelectorState extends State<RoomsAndGuestsSelector> {
  int userRoomSelected = 1;
  int userAdultSelected = 1;
  int userChildrenSelected = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSelectorDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rooms and guests',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                Text('$userRoomSelected'),
                const SizedBox(width: 8),
                Text('$userAdultSelected'),
                const SizedBox(width: 8),
                Text('$userChildrenSelected'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSelectorDialog(BuildContext context) async {
    // Implement your custom dialog logic here
    // You can use showDialog or any other method to show your custom widget
    // For example:
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return YourCustomSelectorWidget();
    //   },
    // );
  }
}
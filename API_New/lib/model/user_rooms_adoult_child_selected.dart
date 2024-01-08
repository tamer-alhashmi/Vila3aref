import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';


class RoomsAndGuestsSelector extends StatefulWidget {
  final Hotel hotel;

  const RoomsAndGuestsSelector ({super.key, required this.onSelectionChanged, required this.hotel});
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
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rooms and Guests Selector'),
          content: Column(
            children: [
              // Your dialog content goes here
              // You can include sliders, buttons, or any other UI elements
              // to allow the user to select the number of rooms and guests
              // For example:
              const Text('Select the number of rooms:'),
              Slider(
                value: userRoomSelected.toDouble(),
                min: 1,
                max: 10,
                onChanged: (value) {
                  setState(() {
                    userRoomSelected = value.toInt();
                  });
                },
              ),
              const Text('Select the number of adults:'),
              Slider(
                value: userAdultSelected.toDouble(),
                min: 1,
                max: 20,
                onChanged: (value) {
                  setState(() {
                    userAdultSelected = value.toInt();
                  });
                },
              ),
              const Text('Select the number of children:'),
              Slider(
                value: userChildrenSelected.toDouble(),
                min: 1,
                max: 5,
                onChanged: (value) {
                  setState(() {
                    userChildrenSelected = value.toInt();
                  });
                },
              ),
              // Repeat similar logic for adult and children selection
              // ...
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Call the callback function with the selected values
                widget.onSelectionChanged(
                  userRoomSelected,
                  userAdultSelected,
                  userChildrenSelected,
                );
              },
              child: const Text('Apply',style: TextStyle(
                color: Colors.blue
              ),),
            ),
          ],
        );
      },
    );
  }}

import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';
class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({super.key, required Hotel hotel, required this.onDatesSelected});

  final Function(DateTime? checkInDate, DateTime? checkOutDate, int nights) onDatesSelected;

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  int calculateNights() {
    if (_checkInDate != null && _checkOutDate != null) {
      final Duration difference = _checkOutDate!.difference(_checkInDate!);
      return difference.inDays;
    }
    return 0;
  }

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = pickedDate;
        } else {
          _checkOutDate = pickedDate;
        }

        final int nights = calculateNights();
        widget.onDatesSelected(_checkInDate, _checkOutDate, nights);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // int nights =
    //     DateSelectionWidget.calculateNightsStatic(_checkInDate, _checkOutDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: const Text('Check-in Date'),
          subtitle: _checkInDate == null
              ? const Text('Select Date')
              : Text('${_checkInDate!.toLocal()}'.split(' ')[0]),
          onTap: () => _selectDate(context, true),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: const Text('Check-out Date'),
          subtitle: _checkOutDate == null
              ? const Text('Select Date')
              : Text('${_checkOutDate!.toLocal()}'.split(' ')[0]),
          onTap: () => _selectDate(context, false),
        ),
        const SizedBox(height: 16),
        // ElevatedButton(
        //   // Select Button
        //   onPressed: _saveDates,
        //   child: const Text('Select'),
        // ),
      ],
    );
  }
}

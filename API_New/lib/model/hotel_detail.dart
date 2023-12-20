import 'package:api_new/model/hotel.dart';
import 'package:flutter/material.dart';



class HotelDetail extends StatefulWidget {
  final Hotel hotel;

  const HotelDetail({super.key, required this.hotel});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {

  Future<void> fetchHotel() async {
    // Your fetch hotel logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Implement menu functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Slider for hotel pictures
            Container(
              height: 200, // Set the height of your slider
              child: PageView.builder(
                itemCount: widget.hotel.images.length * 2, // Make it double the length for a continuous loop
                controller: PageController(
                  initialPage: widget.hotel.images.length * 2 ~/ 2, // Start from the middle for a continuous loop
                  viewportFraction: 0.85, // Adjust the fraction as needed
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/${widget.hotel.name}/SliderPhotos/${widget.hotel.images[index % widget.hotel.images.length]}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // ... Other details of the hotel

            // Button to book
            ElevatedButton(
              onPressed: () {
                // Implement booking functionality
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}

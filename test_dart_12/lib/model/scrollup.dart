import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final ScrollController scrollController;

  const CustomFloatingActionButton({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5.0,
        child: const Icon(
          Icons.arrow_upward,
          size: 30.0,
          semanticLabel: 'Scroll to Top',
        ),
      ),
    );
  }
}

import 'package:api_new/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class CustomBottomBar extends StatelessWidget {
  final BottomAppBar bottomAppBar;
  const CustomBottomBar({super.key, required this.bottomAppBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        snakeViewColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 5),
        // selectedItemColor: Colors.white,
        // selectedLabelStyle: const TextStyle(
        //   color: Colors.white,
        // ),
        // showSelectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          color: AppTheme.buiColorCtaBackground,
        ),
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        //Theme.of(context).colorScheme.secondary,
        showUnselectedLabels: true,
        currentIndex: 0,
        onTap: (val) {},
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}

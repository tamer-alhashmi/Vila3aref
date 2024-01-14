// import 'package:api_new/home.dart';
// import 'package:api_new/model/hotel_detail.dart';
import 'package:api_new/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get.dart';

import 'home.dart';

void main() {
  runApp(const TestDart12());
}

class TestDart12 extends StatelessWidget {
  const TestDart12({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, // Set this to false
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        home: HomeScreen());
  }
}

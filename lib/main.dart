import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manzz_shop/component/splash_screen.dart';
import 'package:manzz_shop/route/app_page.dart';
import 'package:manzz_shop/route/app_route.dart';
import 'package:manzz_shop/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

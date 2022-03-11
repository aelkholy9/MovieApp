import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      home: LoginScreen(),
    );
  }
}

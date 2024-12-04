import 'package:device_preview/device_preview.dart';
import 'package:digi_com/screens/home_screen.dart';
import 'package:digi_com/screens/login_page.dart';
import 'package:digi_com/screens/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

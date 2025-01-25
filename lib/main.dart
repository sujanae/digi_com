import 'package:device_preview/device_preview.dart';
import 'package:digi_com/naruto-api/episode_screen.dart';
import 'package:digi_com/screens/cart_screen.dart';
import 'package:digi_com/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(MyApp());

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: EpisodeScreen());
  }
}

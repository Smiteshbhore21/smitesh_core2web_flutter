import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:music_app/view/start_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

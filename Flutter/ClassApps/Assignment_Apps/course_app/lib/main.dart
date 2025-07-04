import "package:flutter/material.dart";

import "home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Course App",
      debugShowCheckedModeBanner: false,
      home: CourseHome(),
    );
  }
}

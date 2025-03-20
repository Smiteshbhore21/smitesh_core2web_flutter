import "package:flutter/material.dart";
import "package:widget_lifecycle/screen1.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Widget LifeCycle",
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}

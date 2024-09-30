import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Core2Web",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First App"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

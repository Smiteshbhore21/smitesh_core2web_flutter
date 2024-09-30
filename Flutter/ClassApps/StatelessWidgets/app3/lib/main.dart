import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container"),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.amber[200],
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amber[100],
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amber[50],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "Hello Core2Web",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          actions: const [
            Icon(
              Icons.add,
              weight: 49,
              size: 40,
            ),
          ],
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          // child: Container(
          //   height: 200,
          //   width: 360,
          //   color: Colors.blue,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 360,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                width: 360,
                color: Colors.blue[100],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

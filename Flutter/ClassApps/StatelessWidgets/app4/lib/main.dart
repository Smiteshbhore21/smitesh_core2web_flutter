import 'package:flutter/material.dart';

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
          title: const Text("Indian Flag"),
          backgroundColor: Colors.blue[200],
          centerTitle: true,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 5,
                    height: 300,
                    color: Colors.black87,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 250,
                    height: 35,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 250,
                    height: 35,
                    color: Colors.white,
                    child: Image.network(
                        "https://w7.pngwing.com/pngs/705/558/png-transparent-flag-of-india-ashoka-chakra-the-history-of-the-world-dharmachakra-india-thumbnail.png"),
                  ),
                  Container(
                    width: 250,
                    height: 35,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

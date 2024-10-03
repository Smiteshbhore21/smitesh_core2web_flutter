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
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Column Scroll",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455_640.jpg",
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey,
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455_640.jpg",
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey,
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455_640.jpg",
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

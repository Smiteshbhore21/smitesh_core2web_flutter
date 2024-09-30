import "package:flutter/material.dart";

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State createState() => _CounterApp();
}

class _CounterApp extends State {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CounterApp"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Text(
            "$count",
            textScaleFactor: 4.7,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            setState(() {});
          },
          backgroundColor: Colors.lightBlue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

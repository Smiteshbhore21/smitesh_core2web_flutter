import "package:flutter/material.dart";

void main() {
  runApp(const ToggleColor());
}

class ToggleColor extends StatefulWidget {
  const ToggleColor({super.key});

  @override
  State<ToggleColor> createState() => _ToggleColorState();
}

class _ToggleColorState extends State<ToggleColor> {
  bool checkFlag = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ToggleApp"),
          centerTitle: true,
          backgroundColor:
              checkFlag ? Colors.lightBlue[100] : Colors.amber[100],
        ),
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            color: checkFlag ? Colors.amber[100] : Colors.lightBlue[100],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            checkFlag = !checkFlag;
            setState(() {});
          },
        ),
      ),
    );
  }
}

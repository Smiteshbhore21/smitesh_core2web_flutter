import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_lifecycle/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String text = "C2W";
  @override
  Widget build(BuildContext context) {
    log("In Screen1 build()");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Screen2(str: text),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  log("In setState({})");
                  text = (text == "C2W") ? "Core2Web" : "C2W";
                });
              },
              child: const Text("Change Text"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Screen2(str: text),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    log("In initState()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("In didChangeDependencies()");
  }

  @override
  void deactivate() {
    super.deactivate();
    log("In deactivate()");
  }

  @override
  void dispose() {
    super.dispose();
    log("In dispose()");
  }
}

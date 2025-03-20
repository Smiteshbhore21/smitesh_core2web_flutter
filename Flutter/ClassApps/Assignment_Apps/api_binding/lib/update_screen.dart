import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: id,
              decoration: const InputDecoration(
                hintText: "Enter Product ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Enter Product Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: price,
              decoration: const InputDecoration(
                hintText: "Enter Product Price",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: color,
              decoration: const InputDecoration(
                hintText: "Enter Product Color",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.cyan,
                ),
              ),
              onPressed: () {
                updateData(context);
              },
              child: const Text(
                "SUBMIT DATA",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateData(context) async {
    if (id.text.trim().isNotEmpty &&
        name.text.trim().isNotEmpty &&
        price.text.trim().isNotEmpty &&
        color.text.trim().isNotEmpty) {
      Map userData = {
        "name": name.text.trim(),
        "data": {
          "color": color.text.trim(),
          "Price": price.text.trim(),
        }
      };
      Uri url =
          Uri.parse("https://api.restful-api.dev/objects/${id.text.trim()}");
      http.Response response = await http.put(
        url,
        headers: {
          "content-type": "application/json",
        },
        body: json.encode(userData),
      );
      Map jsData = json.decode(response.body);
      log("$jsData");
      Navigator.of(context).pop();
    }
  }
}

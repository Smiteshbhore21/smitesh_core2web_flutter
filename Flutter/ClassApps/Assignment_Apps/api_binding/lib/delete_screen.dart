import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  TextEditingController id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post Data",
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
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.cyan,
                ),
              ),
              onPressed: () {
                deleteData(context);
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

  deleteData(context) async {
    if (id.text.trim().isNotEmpty) {
      Uri url =
          Uri.parse("https://api.restful-api.dev/objects/${id.text.trim()}");
      http.Response response = await http.delete(url);
      Map jsData = json.decode(response.body);
      log("${jsData}");
      Navigator.of(context).pop();
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController color = TextEditingController();

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
                postData(context);
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

  Future<void> postData(context) async {
    if (name.text.trim().isNotEmpty &&
        price.text.trim().isNotEmpty &&
        color.text.trim().isNotEmpty) {
      Map userData = {
        "name": name.text.trim(),
        "data": {
          "color": color.text.trim(),
          "Price": price.text.trim(),
        }
      };
      Uri url = Uri.parse("https://api.restful-api.dev/objects");
      http.Response response = await http.post(
        url,
        headers: {"content-type": "application/json"},
        body: json.encode(userData),
      );
      Map jsData = json.decode(response.body);
      log("${jsData}");
      Navigator.of(context).pop();
    }
  }
}

import 'dart:developer';

import 'package:api_binding/product_screen.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  final List fetchedData;
  const GetData({required this.fetchedData, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<GetData> createState() => _GetDataState(fetchedData);
}

class _GetDataState extends State<GetData> {
  _GetDataState(this.fetchedData);
  List fetchedData;
  Map? product;
  @override
  Widget build(BuildContext context) {
    log("$fetchedData");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Display Data Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: fetchedData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              product = fetchedData[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductScreen(
                      product: product!,
                    );
                  },
                ),
              );
            },
            child: Card(
              color: Colors.grey,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(
                      10,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Image.network(
                      "https://www.pc-tablet.co.in/wp-content/uploads/2024/02/samsung-galaxy-s24-release-date-price-ultra-features-and-mor_2bxp.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "${fetchedData[index]["name"]}",
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

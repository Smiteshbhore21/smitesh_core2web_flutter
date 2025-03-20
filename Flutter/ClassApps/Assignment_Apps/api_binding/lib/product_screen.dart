import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Map? product;
  const ProductScreen({super.key, required this.product});

  @override
  // ignore: no_logic_in_create_state
  State<ProductScreen> createState() => _ProductScreenState(product!);
}

class _ProductScreenState extends State<ProductScreen> {
  Map? product;
  _ProductScreenState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Card(
        color: Colors.grey,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: Text(
                  "${product!["name"]}",
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text: "Color: ",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: (product!["data"]["color"] != null)
                          ? "${product!["data"]["color"]}"
                          : "Not Available",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Price: ",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: (product!["data"]["Price"] != null)
                          ? "${product!["data"]["Price"]}"
                          : "Not Available",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Capacity: ",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: (product!["data"]["capacity"] != null)
                          ? "${product!["data"]["capacity"]}"
                          : "Not Available",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Generation: ",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: (product!["data"]["Generation"] != null)
                          ? "${product!["data"]["Generation"]}"
                          : "Not Available",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

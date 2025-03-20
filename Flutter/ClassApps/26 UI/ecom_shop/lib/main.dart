import "package:ecom_shop/screens/start_screen.dart";
import "package:provider/provider.dart";
import "controller/ecom_data.dart";

import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return const EcomData(
              homeData: [
                {
                  "productTitle": "Tagerine Shirt",
                  "productPrice": 240.32,
                  "productImage": "assets/product_assets/product1.png",
                },
                {
                  "productTitle": "Leather Coart",
                  "productPrice": 325.36,
                  "productImage": "assets/product_assets/product2.png",
                },
                {
                  "productTitle": "Leather Coart1",
                  "productPrice": 325.361,
                  "productImage": "assets/start_screen_assets/banner_image.jpg",
                },
                {
                  "productTitle": "Leather Coart2",
                  "productPrice": 325.362,
                  "productImage": "assets/product_assets/product2.png",
                },
                {
                  "productTitle": "Leather Coart3",
                  "productPrice": 325.363,
                  "productImage": "assets/start_screen_assets/banner_image.jpg",
                },
              ],
            );
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EcomApp(),
      ),
    );
  }
}

class EcomApp extends StatefulWidget {
  const EcomApp({super.key});

  @override
  State<EcomApp> createState() => _EcomAppState();
}

class _EcomAppState extends State<EcomApp> {
  @override
  Widget build(BuildContext context) {
    return const StartScreen();
  }
}

import "package:flutter/material.dart";
import "package:grocery_app/view/login_screen.dart";
import "package:grocery_app/view/splash_screen.dart";

import "controller/grocery_data.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GroceryData(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),
        home: LoginScreen(),
      ),
    );
  }
}

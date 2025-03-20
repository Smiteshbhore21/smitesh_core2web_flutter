import "Splash_Screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Expense Manager",
      debugShowCheckedModeBanner: false,
      home: Expense(),
    );
  }
}

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State createState() => _ExpenseState();
}

class _ExpenseState extends State {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}

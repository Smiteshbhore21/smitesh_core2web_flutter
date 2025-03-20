import 'package:flutter/material.dart';

class GroceryData extends InheritedWidget {
  const GroceryData({super.key, required super.child});

  @override
  bool updateShouldNotify(GroceryData oldWidget) {
    return false;
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailData extends InheritedWidget {
  List mailData;
  int indexSelected;
  Map loginUser;

  EmailData({
    super.key,
    required super.child,
    required this.mailData,
    required this.loginUser,
    required this.indexSelected,
  });

  static EmailData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<EmailData>()!;

  @override
  bool updateShouldNotify(EmailData oldWidget) {
    return mailData != oldWidget.mailData ||
        oldWidget.indexSelected != indexSelected;
  }
}

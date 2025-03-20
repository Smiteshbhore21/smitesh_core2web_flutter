import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:inherited_widget/view/login_page.dart";
import "controller/email_data_controller.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return EmailData(
      indexSelected: -1,
      mailData: [],
      loginUser: {},
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:inherited_widget/controller/email_data_controller.dart';
import 'package:inherited_widget/view/sign_out_page.dart';

class DisplayDataPage extends StatefulWidget {
  const DisplayDataPage({super.key});

  @override
  State<DisplayDataPage> createState() => _DisplayDataPageState();
}

class _DisplayDataPageState extends State<DisplayDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Email Data Display",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: EmailData.of(context).mailData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              EmailData.of(context).indexSelected = index;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignOutPage(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email : ${EmailData.of(context).mailData[index].data()["email"]}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Password : ${EmailData.of(context).mailData[index].data()["password"]}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
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

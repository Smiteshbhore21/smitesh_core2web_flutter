import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State createState() => _TravelState();
}

class _TravelState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(),
        actions: const [
          Icon(
            Icons.favorite_sharp,
            color: Colors.white,
          ),
          Icon(
            Icons.menu_sharp,
            color: Colors.white,
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(27, 48, 101, 1),
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            10,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

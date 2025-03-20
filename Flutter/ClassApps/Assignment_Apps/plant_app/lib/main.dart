import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Plant App",
      home: Plant(),
    );
  }
}

class Plant extends StatefulWidget {
  const Plant({super.key});

  @override
  State createState() => _PlantState();
}

class _PlantState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/Get Started.png",
              fit: BoxFit.cover,
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Enjoy your\nlife with ",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 35,
              ),
              children: [
                TextSpan(
                  text: "Plants",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const LogIn();
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 25,
              ),
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(62, 102, 24, 1),
                    Color.fromRGBO(124, 180, 70, 1),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

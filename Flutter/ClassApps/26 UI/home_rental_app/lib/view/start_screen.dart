import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Image.asset(
              "assets/start/start_image.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Lets find your Paradise",
            style: GoogleFonts.poppins(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Text(
              textAlign: TextAlign.center,
              "Find your perfect dream space with just a few clicks",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(101, 101, 101, 1),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(32, 169, 247, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "Get Started",
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

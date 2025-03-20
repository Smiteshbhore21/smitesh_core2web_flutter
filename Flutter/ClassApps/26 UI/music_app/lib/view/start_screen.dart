import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/view/main_screen.dart';

import '../controller/music_data.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  MusicData musicDataController = Get.put(MusicData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/start_page/banner.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 250,
            left: 1,
            right: 1,
            child: Container(
              height: 155,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(19, 19, 19, 1),
                    blurRadius: 100,
                    spreadRadius: 100,
                    blurStyle: BlurStyle.normal,
                    offset: Offset(0, 110),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 300,
            left: 1,
            right: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Dancing between The shadows Of rhythm",
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 225,
            left: 30,
            right: 30,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(
                  Color.fromRGBO(255, 46, 0, 1),
                ),
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        19,
                      ),
                    ),
                  ),
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size(
                    MediaQuery.of(context).size.width,
                    47,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Get started",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 160,
            left: 30,
            right: 30,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(
                  Colors.black,
                ),
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(255, 46, 0, 1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        19,
                      ),
                    ),
                  ),
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size(
                    MediaQuery.of(context).size.width,
                    47,
                  ),
                ),
                overlayColor: const WidgetStatePropertyAll(
                  Color.fromRGBO(255, 255, 255, 0.1),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Continue with Email",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 46, 0, 1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "by continuing you agree to terms of services and  Privacy policy",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(203, 200, 200, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

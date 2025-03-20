import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(83, 177, 117, 1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/app_logo.svg",
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "nector",
                  style: GoogleFonts.dmSans(
                    height: 0,
                    fontSize: 65,
                    color: Colors.white,
                    textStyle: const TextStyle(
                      height: 0,
                    ),
                  ),
                ),
                Text(
                  "online groceriet",
                  style: GoogleFonts.dmSans(
                    height: 0,
                    fontSize: 25,
                    color: Colors.white,
                    textStyle: const TextStyle(
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

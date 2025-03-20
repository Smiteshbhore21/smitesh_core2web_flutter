import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "^",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "^",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Text(
              "V",
              style: GoogleFonts.poppins(
                fontSize: 30,
              ),
            ),
            Text(
              "____",
              style: GoogleFonts.poppins(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

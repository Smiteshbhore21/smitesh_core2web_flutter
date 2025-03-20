import 'login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Future splashScreen(context) async {
  await Future.delayed(
    const Duration(seconds: 3),
    () async {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ),
      );
    },
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashScreen(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 145,
              width: 145,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(234, 238, 235, 1),
              ),
              child: SvgPicture.asset("assets/logo.svg"),
            ),
          ),
          const Spacer(),
          Text(
            textAlign: TextAlign.center,
            "Expense Manager",
            style: GoogleFonts.poppins(
              height: 5,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

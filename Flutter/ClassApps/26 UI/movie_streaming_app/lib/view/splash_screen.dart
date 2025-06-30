import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/controller/login_session.dart';
import 'package:movie_streaming_app/controller/movie_data.dart';
import 'package:movie_streaming_app/view/main_home.dart';
import 'package:movie_streaming_app/view/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State createState() => _SplashScreen();
}

class _SplashScreen extends State {
  final MovieData movieData = Get.put(MovieData());
  @override
  void initState() {
    super.initState();
    _startUpSequence();
  }

  Future<void> _startUpSequence() async {
    await movieData.fetchData();
    await LoginSession.getLoginSession();
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      if (LoginSession.isLoggin) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainHome(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const StartScreen(),
          ),
        );
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 7, 30, 1),
      body: Center(
        child: Text(
          "Loading…",
          style: GoogleFonts.secularOne(
            fontSize: MediaQuery.of(context).size.width * 0.0379464286,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

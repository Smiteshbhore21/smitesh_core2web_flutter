import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/verification.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State createState() => _LogInState();
}

class _LogInState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/Login circles.png",
            scale: 0.8,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            alignment: Alignment.center,
            child: Text(
              "Log in",
              style: GoogleFonts.rubik(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Mobile Number",
                hintStyle: GoogleFonts.inter(
                  color: const Color.fromRGBO(164, 164, 164, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                prefixIcon: const Icon(
                  color: Color.fromRGBO(164, 164, 164, 1),
                  Icons.call_outlined,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(204, 211, 196, 1),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Verification();
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 25,
              ),
              height: 60,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
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
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Verification();
                      },
                    ),
                  );
                },
                child: Text(
                  "Log in",
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Image.asset(
                "assets/Login.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

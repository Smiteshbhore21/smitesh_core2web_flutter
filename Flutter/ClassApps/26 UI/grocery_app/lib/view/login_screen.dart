import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/view/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                  ),
                  child: SvgPicture.asset(
                    "assets/login_app_logo.svg",
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              Text(
                "Loging",
                style: GoogleFonts.dmSans(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Enter your emails and password",
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Email",
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              TextField(
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Password",
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: isNotVisible,
                decoration: InputDecoration(
                  suffixIcon: isNotVisible
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isNotVisible = !isNotVisible;
                            });
                          },
                          child: const Icon(Icons.visibility_outlined),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isNotVisible = !isNotVisible;
                            });
                          },
                          child: const Icon(Icons.visibility_off_outlined),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "Forget Password?",
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(124, 124, 124, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(
                      MediaQuery.of(context).size.width,
                      67,
                    ),
                  ),
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromRGBO(83, 177, 117, 1),
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
                ),
                child: Text(
                  "Log In",
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(255, 249, 255, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don’t have an account? ",
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(24, 23, 37, 1),
                    ),
                    children: [
                      TextSpan(
                        text: "Signup",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(83, 177, 117, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

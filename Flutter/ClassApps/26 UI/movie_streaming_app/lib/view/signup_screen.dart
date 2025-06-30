import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/model/snack_bar_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  bool isAgree = false;
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/login_screen/main_bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(137, 42, 236, 0.6),
                    Color.fromRGBO(54, 53, 236, 0.6),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 75,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                      Text(
                        "Create Account",
                        style: GoogleFonts.secularOne(
                          fontWeight: FontWeight.w400,
                          fontSize:
                              MediaQuery.of(context).size.width * 0.1071428571,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.secularOne(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0357142857,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: emailController,
                            style: GoogleFonts.secularOne(
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0357142857,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(63, 30, 136, 1),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(137, 42, 236, 1),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(137, 42, 236, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.secularOne(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0357142857,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: hidePassword,
                            style: GoogleFonts.secularOne(
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0357142857,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              suffixIconColor: Colors.white,
                              suffixIcon: (hidePassword)
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      child: const Icon(Icons.visibility_off))
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      child: const Icon(Icons.visibility)),
                              filled: true,
                              fillColor: const Color.fromRGBO(63, 30, 136, 1),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(137, 42, 236, 1),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(137, 42, 236, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (emailController.text.trim().isNotEmpty &&
                              passwordController.text.trim().isNotEmpty) {
                            try {
                              await _firebaseAuth
                                  .createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              if (context.mounted) {
                                snackBar(
                                  text: "Account Created",
                                  context: context,
                                );
                              }
                            } on FirebaseAuthException catch (error) {
                              if (context.mounted) {
                                snackBar(
                                  text: error.code,
                                  context: context,
                                );
                              }
                            } finally {
                              emailController.clear();
                              passwordController.clear();
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            }
                          } else {
                            snackBar(
                              text: "Please enter valid fields",
                              context: context,
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(54, 53, 236, 1),
                                Color.fromRGBO(137, 42, 236, 1),
                              ],
                            ),
                          ),
                          child: Text(
                            "Create Account",
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(250, 243, 221, 1),
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0401785714,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

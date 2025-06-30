import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/view/login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int sliderIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CarouselSlider(
              items: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/start_screen/image1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/start_screen/image2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/start_screen/image3.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reson) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(10, 7, 30, 0),
                      Color.fromRGBO(10, 7, 30, 1),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        "WE HAVE THE BEST MOVIES",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.secularOne(
                          color: Colors.white,
                          fontSize:
                              MediaQuery.of(context).size.width * 0.0803571429,
                          height: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color:
                                  sliderIndex == 0 ? Colors.white : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color:
                                  sliderIndex == 1 ? Colors.white : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color:
                                  sliderIndex == 2 ? Colors.white : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Sed egestas mi hac faucibus vitae commodo. Tempor sagittis elementum suspendisse est convallis morbi. Quam viverra sed bibendum id felis dictum ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(250, 243, 221, 1),
                          fontSize:
                              MediaQuery.of(context).size.width * 0.0267857143,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
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
                            "Suscribete a Movie+",
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(250, 243, 221, 1),
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0401785714,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
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

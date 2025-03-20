import 'package:course_app/detailedScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseHome extends StatefulWidget {
  const CourseHome({super.key});

  @override
  State createState() => _CourseHomeState();
}

class _CourseHomeState extends State {
  List cardDetails = [
    {
      "title": "UX Designer from Scratch.",
      "image": "assets/svg1.svg",
      "gradColor": [
        const Color.fromRGBO(197, 4, 98, 1),
        const Color.fromRGBO(80, 3, 112, 1),
      ],
    },
    {
      "title": "Design Thinking The Beginner",
      "image": "assets/svg2.svg",
      "gradColor": [
        const Color.fromRGBO(0, 77, 228, 1),
        const Color.fromRGBO(1, 47, 135, 1),
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(205, 218, 218, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.line_horizontal_3,
                      size: 30,
                    ),
                    Icon(
                      CupertinoIcons.bell,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Welcome to New",
                  style: GoogleFonts.jost(
                    fontSize: 27,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "Educourse",
                  style: GoogleFonts.jost(
                    fontSize: 37,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SearchBar(
                  shadowColor: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  hintText: "Enter your Keyword",
                  hintStyle: WidgetStatePropertyAll(
                    GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 35,
                      ),
                    ),
                  ],
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38),
                  topRight: Radius.circular(38),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Course For You",
                      style: GoogleFonts.jost(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 290,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cardDetails.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DetailedScreen(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 5),
                            height: 270,
                            width: 220,
                            decoration: BoxDecoration(
                              // color: Colors.amberAccent,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  cardDetails[index]["gradColor"][0],
                                  cardDetails[index]["gradColor"][1],
                                ],
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      cardDetails[index]["title"],
                                      style: GoogleFonts.jost(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SvgPicture.asset(
                                      cardDetails[index]["image"],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Course By Category",
                      style: GoogleFonts.jost(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                              color: Color.fromRGBO(25, 0, 56, 1),
                            ),
                            child: SvgPicture.asset(
                              "assets/uiux.svg",
                              fit: BoxFit.none,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "UI/UX",
                            style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                              color: Color.fromRGBO(25, 0, 56, 1),
                            ),
                            child: SvgPicture.asset(
                              "assets/visual.svg",
                              fit: BoxFit.none,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "VISUAL",
                            style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                              color: Color.fromRGBO(25, 0, 56, 1),
                            ),
                            child: SvgPicture.asset(
                              "assets/illustration.svg",
                              fit: BoxFit.none,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ILLUSTRATION",
                            style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                              color: Color.fromRGBO(25, 0, 56, 1),
                            ),
                            child: SvgPicture.asset(
                              "assets/photo.svg",
                              fit: BoxFit.none,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "PHOTO",
                            style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

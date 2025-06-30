import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/view/account_screen.dart';
import 'package:movie_streaming_app/view/detail_screen.dart';

import '../controller/movie_data.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  MovieData movieData = Get.find();
  int sliderIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("${MediaQuery.of(context).size.width}");
    log("${movieData.topMovies.length}");
    log("${movieData.onlyOnMoviesPlus.length}");

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(10, 7, 30, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const DrawerButton(
          color: Colors.white,
        ),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            ),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: movieData.topMovies.length,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          displayData: movieData.topMovies[index],
                          listName: "topMovieList",
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 540,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(10, 7, 30, 1),
                          ),
                          child: Image.network(
                            "${movieData.topMovies[index]["posterLarge"]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(10, 7, 30, 1),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(10, 7, 30, 0),
                                Color.fromRGBO(10, 7, 30, 1),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Movie+",
                                style: GoogleFonts.secularOne(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0379464286,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${movieData.topMovies[index]["title"]}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.secularOne(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0714285714,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "to marathon",
                                style: GoogleFonts.poppins(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0401785714,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${movieData.topMovies[index]["original_title"]}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.03125,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 70,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 560,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reson) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 500,
                ),
                SizedBox(
                  height: 10,
                  child: Row(
                    children: [
                      const Spacer(),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: movieData.topMovies.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 8,
                            width: 8,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: sliderIndex == index
                                  ? Colors.white
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myListDisplay(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    "Only on Movie+",
                    style: GoogleFonts.poppins(
                      fontSize:
                          MediaQuery.of(context).size.width * 0.0491071429,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final itemWidth = width * 0.29;
                    final imageSize = itemWidth;
                    final height = width * 0.45;
                    return SizedBox(
                      height: height,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieData.onlyOnMoviesPlus.length,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        itemBuilder: (context, index) {
                          return Container(
                            width: itemWidth,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      displayData:
                                          movieData.onlyOnMoviesPlus[index],
                                      listName: "onlyPlusMovies",
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: imageSize,
                                    height: imageSize + 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration:
                                        const BoxDecoration(color: Colors.grey),
                                    child: Image.network(
                                      "${movieData.onlyOnMoviesPlus[index]["poster"]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Center(
                  child: Text(
                    "Welcome to Movie+",
                    style: GoogleFonts.poppins(
                      fontSize:
                          MediaQuery.of(context).size.width * 0.0379464286,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Find the Best Here at Movie+",
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.03125,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: const WidgetStatePropertyAll(
                        RoundedRectangleBorder(),
                      ),
                      fixedSize: WidgetStatePropertyAll(
                        Size(
                          MediaQuery.of(context).size.width * 0.9,
                          MediaQuery.of(context).size.width * 0.0848214286,
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        Color.fromRGBO(137, 42, 236, 0.3),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "EXPLORE",
                        style: GoogleFonts.poppins(
                          fontSize:
                              MediaQuery.of(context).size.width * 0.0379464286,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 2,
        backgroundColor: const Color.fromRGBO(10, 7, 30, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Series",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Films",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Originals",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Newly Added",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Last Days",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Soon",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gender",
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.03125,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
            Center(
              child: SizedBox(
                child: Image.asset(
                  "assets/drawer_screen/all_studio_logos.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myListDisplay() {
    if (movieData.myList.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            "My List",
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.0491071429,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final itemWidth = width * 0.29;
            final imageSize = itemWidth;
            final height = width * 0.44;

            return SizedBox(
              height: height,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieData.myList.length,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, index) {
                  return Container(
                    width: itemWidth,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              displayData: movieData.myList[index],
                              listName: "onlyPlusMovies",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: imageSize,
                            height: imageSize,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(color: Colors.grey),
                            child: Image.network(
                              "${movieData.myList[index]["poster"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${movieData.myList[index]["title"]}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: width * 0.03125,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

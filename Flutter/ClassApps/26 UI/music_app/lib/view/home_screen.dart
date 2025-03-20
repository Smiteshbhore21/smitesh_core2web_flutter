import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/controller/music_data.dart';
import 'package:music_app/view/play_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicData musicDataController = Get.put(MusicData());
  int channelIndex = 0;
  ScrollController mainScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: SingleChildScrollView(
        controller: mainScrollController,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: musicDataController.carouselChannels.length,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  height: 400,
                  width: 460,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          musicDataController.carouselChannels[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 20,
                        child: Text(
                          musicDataController.carouselChannels[index]["title"],
                          style: GoogleFonts.inter(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                          height: 40,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(19),
                            ),
                            color: Color.fromRGBO(255, 46, 0, 1),
                          ),
                          child: Text(
                            "Subscribe",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  clipBehavior: Clip.hardEdge,
                  onPageChanged: (index, reason) {
                    setState(() {
                      channelIndex = index;
                    });
                  },
                  onScrolled: (index) {
                    setState(() {
                      channelIndex = index!.toInt();
                    });
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (channelIndex <= 0)
                        ? const Color.fromRGBO(255, 61, 0, 1)
                        : const Color.fromRGBO(159, 159, 159, 1),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (channelIndex == 1)
                        ? const Color.fromRGBO(255, 61, 0, 1)
                        : const Color.fromRGBO(159, 159, 159, 1),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (channelIndex >= 2)
                        ? const Color.fromRGBO(255, 61, 0, 1)
                        : const Color.fromRGBO(159, 159, 159, 1),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discography",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color.fromRGBO(255, 46, 0, 1),
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color.fromRGBO(248, 162, 69, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 235,
              child: ListView.builder(
                itemCount: musicDataController.discographyMap.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() {
                        return PlayScreen(from: "discographyMap", index: index);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 190,
                            width: 160,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              musicDataController.discographyMap[index]
                                  ["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            musicDataController.discographyMap[index]["title"],
                            style: GoogleFonts.inter(
                              color: const Color.fromRGBO(203, 200, 200, 1),
                            ),
                          ),
                          Text(
                            musicDataController.discographyMap[index]["year"],
                            style: GoogleFonts.inter(
                              color: const Color.fromRGBO(132, 125, 125, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular singles",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color.fromRGBO(203, 200, 200, 1),
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color.fromRGBO(248, 162, 69, 1),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              controller: mainScrollController,
              shrinkWrap: true,
              itemCount: musicDataController.popularSinglesMap.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() {
                      return PlayScreen(
                          from: "popularSinglesMap", index: index);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            musicDataController.popularSinglesMap[index]
                                ["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                musicDataController.popularSinglesMap[index]
                                    ["title"],
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: const Color.fromRGBO(203, 200, 200, 1),
                                ),
                              ),
                              Text(
                                "${musicDataController.popularSinglesMap[index]["year"]} * ${musicDataController.popularSinglesMap[index]["singer"]}",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: const Color.fromRGBO(132, 125, 125, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

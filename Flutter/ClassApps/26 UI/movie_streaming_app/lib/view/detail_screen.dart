import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/view/video_play_screen.dart';

class DetailScreen extends StatefulWidget {
  final Map displayData;
  final String listName;

  const DetailScreen(
      {required this.displayData, required this.listName, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    int movieHrs = widget.displayData["runtime_minutes"] != null
        ? (widget.displayData["runtime_minutes"] / 60).toInt()
        : 0;
    int movieMin = widget.displayData["runtime_minutes"] != null
        ? (((widget.displayData["runtime_minutes"] / 60) - movieHrs) * 60)
            .toInt()
        : 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(10, 7, 30, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
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
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.2053571429,
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
                        "${widget.displayData["posterLarge"]}",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.displayData["title"]}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.secularOne(
                              fontSize: MediaQuery.of(context).size.width *
                                  0.0714285714,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${movieHrs}H",
                                style: GoogleFonts.poppins(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.03125,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.7),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${movieMin}MIN",
                                style: GoogleFonts.poppins(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.03125,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.7),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${widget.displayData["year"]}",
                                style: GoogleFonts.poppins(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.03125,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return VideoPlayerScreen(
                                          title: widget.displayData["title"],
                                          url: widget.displayData["trailer"]);
                                    },
                                  ));
                                },
                                child: const Icon(
                                  Icons.play_circle_outline,
                                  size: 55,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.add,
                                size: 45,
                                weight: 1,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.file_download_outlined,
                                size: 45,
                                weight: 1,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Text(
                "${widget.displayData["plot_overview"]}",
                textAlign: TextAlign.start,
                style: GoogleFonts.secularOne(
                  fontSize: MediaQuery.of(context).size.width * 0.03125,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 10,
              ),
              child: Text(
                "${widget.displayData["plot_overview"]}",
                textAlign: TextAlign.start,
                style: GoogleFonts.secularOne(
                  fontSize: MediaQuery.of(context).size.width * 0.0223214286,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(255, 255, 255, 0.7),
                ),
              ),
            ),
            ExpansionTile(
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.zero,
              ),
              collapsedShape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.zero,
              ),
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              title: Text(
                "Genres",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.0334821429,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              children: listToWidget(widget.displayData["genre_names"]),
            ),
            ExpansionTile(
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.zero,
              ),
              collapsedShape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.zero,
              ),
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              title: Text(
                "Also Available on",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.0334821429,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              children: listToWidget(widget.displayData["network_names"]),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listToWidget(List<dynamic> list) {
    List<Widget> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(
        Text(
          textAlign: TextAlign.start,
          "${list[i]}",
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.0223214286,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(255, 255, 255, 0.7),
          ),
        ),
      );
    }

    return result;
  }
}

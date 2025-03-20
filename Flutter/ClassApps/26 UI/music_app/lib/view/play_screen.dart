import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/controller/music_data.dart';

class PlayScreen extends StatefulWidget {
  final String from;
  final int index;
  const PlayScreen({required this.from, required this.index, super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  MusicData musicController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    fetchMusic(widget.index, widget.from);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxSecond = _duration.inSeconds.toDouble();
    double currentSeconds = _position.inSeconds.toDouble();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 700,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  (widget.from == "popularSinglesMap")
                      ? musicController.popularSinglesMap[widget.index]["image"]
                      : musicController.discographyMap[widget.index]["image"],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 1,
                right: 1,
                child: Container(
                  height: 155,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(19, 19, 19, 1),
                        blurRadius: 100,
                        spreadRadius: 100,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 110),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 550,
              ),
              Text(
                (widget.from == "popularSinglesMap")
                    ? musicController.popularSinglesMap[widget.index]["title"]
                    : musicController.discographyMap[widget.index]["title"],
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(230, 154, 21, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                (widget.from == "popularSinglesMap")
                    ? musicController.popularSinglesMap[widget.index]["singer"]
                    : musicController.discographyMap[widget.index]["singer"],
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      musicController.favoriteList.add(
                          (widget.from == "popularSinglesMap")
                              ? musicController.popularSinglesMap[widget.index]
                              : musicController.discographyMap[widget.index]);
                      log("${musicController.favoriteList}");
                    },
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color.fromRGBO(230, 154, 21, 1),
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.ios_share_rounded,
                    color: Color.fromRGBO(230, 154, 21, 1),
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SliderTheme(
                data: const SliderThemeData(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                  trackHeight: 5,
                  inactiveTrackColor: Color.fromRGBO(217, 217, 217, 0.19),
                  activeTrackColor: Color.fromRGBO(230, 154, 21, 1),
                ),
                child: Slider(
                  value: currentSeconds,
                  min: 0,
                  max: maxSecond > 0 ? maxSecond : 1,
                  onChanged: (double value) {
                    log("${value.toInt()}");
                    final newPosition = Duration(seconds: value.toInt() + 1);
                    setState(() {
                      _position = newPosition;
                    });
                    musicController.audioPlayer.seek(newPosition);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.repeat_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  const Icon(
                    Icons.arrow_left_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (((widget.from == "popularSinglesMap")
                          ? musicController.popularSinglesMap[widget.index]
                              ["isPlaying"]
                          : musicController.discographyMap[widget.index]
                              ["isPlaying"])) {
                        (widget.from == "popularSinglesMap")
                            ? musicController.popularSinglesMap[widget.index]
                                ["isPlaying"] = false
                            : musicController.discographyMap[widget.index]
                                ["isPlaying"] = false;
                        pauseMusic();
                      } else {
                        (widget.from == "popularSinglesMap")
                            ? musicController.popularSinglesMap[widget.index]
                                ["isPlaying"] = true
                            : musicController.discographyMap[widget.index]
                                ["isPlaying"] = true;

                        playMusic();
                      }
                      setState(() {});
                    },
                    child: Icon(
                      ((widget.from == "popularSinglesMap")
                              ? musicController.popularSinglesMap[widget.index]
                                  ["isPlaying"]
                              : musicController.discographyMap[widget.index]
                                  ["isPlaying"])
                          ? Icons.pause_circle_filled_sharp
                          : Icons.play_circle_fill_sharp,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> playMusic() async {
    await musicController.audioPlayer.play();
  }

  Future<void> fetchMusic(int index, String from) async {
    try {
      if (from == "popularSinglesMap") {
        await musicController.audioPlayer
            .setUrl(musicController.popularSinglesMap[index]["musicUrl"]);
        _duration = musicController.audioPlayer.duration!;
        log("${_duration.inMinutes} Min");
        setState(() {});
      } else {
        await musicController.audioPlayer
            .setUrl(musicController.discographyMap[index]["musicUrl"]);
        _duration = musicController.audioPlayer.duration!;
        log("${_duration.inMinutes} Min");
        setState(() {});
      }
    } catch (e) {
      log("$e");
    }
  }

  Future<void> pauseMusic() async {
    musicController.audioPlayer.pause();
  }
}

import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicData extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  List<Map> carouselChannels = [
    {
      "title": "A.L.O.N.E",
      "image": "assets/home_page/carousel/image1.png",
    },
  ];
  List<Map> discographyMap = [
    {
      "title": "Dead inside",
      "year": "2020",
      "image": "assets/home_page/discographyImages/deadInside.jpg",
      "singer": "Easy Living1",
      "musicUrl":
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      "isPlaying": false,
      "listType": "discographyMap",
    },
    {
      "title": "Alone",
      "year": "2023",
      "image": "assets/home_page/discographyImages/alone.jpg",
      "singer": "Youlakou",
      "musicUrl":
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "isPlaying": false,
      "listType": "discographyMap",
    },
    {
      "title": "Heartless",
      "year": "2023",
      "image": "assets/home_page/discographyImages/heartless.jpg",
      "singer": "Easy Living3",
      "musicUrl":
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "isPlaying": false,
      "listType": "discographyMap",
    },
  ];
  List<Map> popularSinglesMap = [
    {
      "title": "We Are Chaos",
      "year": "2023",
      "singer": "Easy Living",
      "image": "assets/home_page/popularSingles/weAreChaos.jpg",
      "musicUrl":
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "isPlaying": false,
      "listType": "popularSinglesMap",
    },
    {
      "title": "Smile",
      "year": "2023",
      "singer": "Berrechid",
      "image": "assets/home_page/popularSingles/Smile.jpg",
      "musicUrl":
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "isPlaying": false,
      "listType": "popularSinglesMap",
    },
  ];

  List<Map> favoriteList = [];
}

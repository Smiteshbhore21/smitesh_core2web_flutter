import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MovieData extends GetxController {
  List allMovie = [], topMovies = [], myList = [], onlyOnMoviesPlus = [];
  Map allTitles = {};

  MovieData() {
    log("In MovieData Contructor");
  }

  Future<void> fetchData() async {
    String api =
        "https://api.watchmode.com/v1/list-titles/?apiKey=n62pRwIPxth5SVzUU9U4PfSGz9CjbxhJGWATADmk&source_ids=203,57";
    Uri url = Uri.parse(api);
    http.Response responseData = await http.get(url);
    allTitles = json.decode(responseData.body);
    log("${allTitles["titles"].length}");
    for (int i = 0; i < 11; i++) {
      Uri url = Uri.parse(
          "https://api.watchmode.com/v1/title/${allTitles["titles"][i]["id"]}/details/?apiKey=n62pRwIPxth5SVzUU9U4PfSGz9CjbxhJGWATADmk&append_to_response=sources");
      http.Response responseData = await http.get(url);
      allMovie.add(json.decode(responseData.body));
      if (allMovie[i]["user_rating"] != null &&
          allMovie[i]["user_rating"] >= 7.0 &&
          topMovies.length < 6) {
        log("topMovies add");
        topMovies.add(allMovie[i]);
        onlyOnMoviesPlus.add(allMovie[i]);
      } else if (allMovie[i]["user_rating"] != null) {
        onlyOnMoviesPlus.add(allMovie[i]);
      }
    }
  }
}

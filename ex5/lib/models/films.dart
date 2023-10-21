import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Film{
  final String id;
  final String title;
  final String imageUrl;
  final String movie_bannerUrl;
  final String description;
  final String release_date;
  final String director;
  final String running_time;
  final String score;

  Film(
      this.id,
      this.title,
      this.imageUrl,
      this.movie_bannerUrl,
      this.description,
      this.release_date,
      this.director,
      this.running_time,
      this.score);

  Film.fromJson(Map<String, dynamic> jsonObj)
      : this(
    jsonObj["id"],
    jsonObj["title"],
    jsonObj["image"],
    jsonObj["movie_banner"],
    jsonObj["description"],
    jsonObj["release_date"],
    jsonObj["director"],
    jsonObj["running_time"],
    jsonObj["rt_score"],
  );
  @override
  String toString() {
    return 'Film{id: $id, title: $title, imageUrl: $imageUrl, movie_bannerUrl: $movie_bannerUrl, description: $description, release_date: $release_date, director: $director, running_time: $running_time, score: $score}';
  }
  static const url = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";
  static Future<List<Film>> fetchFilms() async {
    var response = await http.get(Uri.parse("$url/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Film>((jsonObj) => Film.fromJson(jsonObj)).toList();
    }, response.body);
  }
}
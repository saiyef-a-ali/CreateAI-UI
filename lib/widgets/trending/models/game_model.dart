import 'package:flutter/material.dart';


class GameModel {
  int id;
  String name;
  List<String> genre;
  double rating;
  String director;
  String storyLine;
  Image image;
  Image imageLogo;

  GameModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.genre,
    required this.director,
    required this.storyLine,
    required this.image,
    required this.imageLogo,
  });
}
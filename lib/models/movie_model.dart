import 'package:flutter/material.dart';
import 'package:newui/models/cast_model.dart';


class GameModel {
  int id;
  String name;
  List<String> genre;
  double rating;
  String director;
  String storyLine;
  Image image;
  Image imageLogo;
  List<GameCastModel> castList;

  GameModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.genre,
    required this.director,
    required this.storyLine,
    required this.image,
    required this.imageLogo,
    required this.castList,
  });
}
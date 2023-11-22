import 'package:flutter/material.dart';
import 'package:newui/constants/constants.dart';
import 'package:newui/screens/components/background_list_view.dart';
import 'package:newui/screens/components/movie_list_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Size get size => MediaQuery.of(context).size;

  //to Center the game List View
  double get gameItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController gameScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    // connecting Background list and game list
    gameScrollController.addListener(() {
      backgroundScrollController.jumpTo(
        gameScrollController.offset * (size.width / gameItemWidth)
      );
    });

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of home screen
          BackgroundListView(backgroundScrollController),

          //game detail List view
          GameListView(gameScrollController, gameItemWidth,),

          //Appbar
        ],
      ),
    );
  }
}
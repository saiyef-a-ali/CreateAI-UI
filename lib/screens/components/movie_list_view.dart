import 'package:flutter/material.dart';
import 'package:newui/data/data.dart';
import 'package:newui/screens/components/movie_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class GameListView extends StatefulWidget {

  final ScrollController GameScrollController;
  final double GameItemWidth;

  GameListView(this.GameScrollController,this.GameItemWidth);

  @override
  _GameListViewState createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  var gameData = GameData();


  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_,value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ScrollSnapList(
            listController: widget.GameScrollController,
            onItemFocus: (item) {
            },
            itemSize: widget.GameItemWidth,
            padding: EdgeInsets.zero,
            itemCount: gameData.GameList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GameIndex(index, widget.GameScrollController, widget.GameItemWidth);
            },
          ),
        ),
      ),
    );
  }
}
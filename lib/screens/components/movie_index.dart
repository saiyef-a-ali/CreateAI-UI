import 'package:flutter/material.dart';
import 'package:newui/constants/constants.dart';
import 'package:newui/data/data.dart';

class GameIndex extends StatefulWidget {
  final int index;
  final ScrollController GameScrollController;
  final double GameItemWidth;

  GameIndex(this.index, this.GameScrollController, this.GameItemWidth);

  @override
  _GameIndexState createState() => _GameIndexState();
}

class _GameIndexState extends State<GameIndex> {
  var gameData = GameData();
  double maxGameTranslate = 65;

  double _GameTranslate(double offset, double activeOffset) {
    double translate;
      if (widget.GameScrollController.offset + widget.GameItemWidth <=
        activeOffset) {
      translate = maxGameTranslate;
    } else if (widget.GameScrollController.offset <= activeOffset) {
      translate = maxGameTranslate -
          ((widget.GameScrollController.offset -
              (activeOffset - widget.GameItemWidth)) /
              widget.GameItemWidth *
              maxGameTranslate);
    } else if (widget.GameScrollController.offset <
        activeOffset + widget.GameItemWidth) {
      translate = ((widget.GameScrollController.offset -
          (activeOffset - widget.GameItemWidth)) /
          widget.GameItemWidth *
          maxGameTranslate) -
          maxGameTranslate;
    } else {
      translate = maxGameTranslate;
    }
    return translate;
  }

  double _GameDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (widget.GameScrollController.offset + widget.GameItemWidth <=
        activeOffset) {
      opacity = 0;
    } else if (widget.GameScrollController.offset <= activeOffset) {
      opacity = ((widget.GameScrollController.offset -
          (activeOffset - widget.GameItemWidth)) /
          widget.GameItemWidth *
          100);
    } else if (widget.GameScrollController.offset <
        activeOffset + widget.GameItemWidth) {
      opacity = 100 -
          (((widget.GameScrollController.offset -
              (activeOffset - widget.GameItemWidth)) /
              widget.GameItemWidth *
              100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.GameScrollController,
            builder: (ctx, child) {
              double activeOffset = widget.index * widget.GameItemWidth;

              double translate =
                  _GameTranslate(widget.GameScrollController.offset, activeOffset);

              return SizedBox(
                height: translate,
              );
            },
          ),
          SizedBox(
            height: size.height * .008,
          ),
          Container(
            height: size.height * .15,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: size.width / 2.5,
                image: gameData.GameList[widget.index].imageLogo.image,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .005,
          ),
          Container(
            width: size.width * .25,
            height: 1,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          InkWell(
            onTap: () {
              // Handle the 'BUY TICKET' button tap here
            },
            child: Container(
              width: size.width * .25,
              height: size.height * .05,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'TAKE CASE',
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          GestureDetector(
            onTap: () {
              // Handle the image tap here
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image(
                image: gameData.GameList[widget.index].image.image,
                width: size.width * 0.5,
                height: size.height * 0.35,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          AnimatedBuilder(
            animation: widget.GameScrollController,
            builder: (context, child) {
              double activeOffset = widget.index * widget.GameItemWidth;
              double opacity = _GameDescriptionOpacity(
                  widget.GameScrollController.offset, activeOffset);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      gameData.GameList[widget.index].name,
                      style: TextStyle(
                        color: white,
                        fontSize: size.width / 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

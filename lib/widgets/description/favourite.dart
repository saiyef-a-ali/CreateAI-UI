import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Favourite extends StatelessWidget {
  const Favourite({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key);

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    // Calculate opacity based on the scroll percentage

    return Positioned(
      top: size.height * 0.20,
      right: 25,
      child: AnimatedOpacity(
              duration: const Duration(milliseconds: 80),
              opacity: 1.0 - pow(percent, 0.001),
              child: LikeButton(
          size: 30,
          circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.bookmark,
              color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
              size: 50,
            );
          },
        ),
            ),

      );
  }
}

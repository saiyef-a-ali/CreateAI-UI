import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newui/widgets/description/background_sliver.dart';
import 'package:newui/widgets/description/button_back.dart';
import 'package:newui/widgets/description/coverphoto.dart';
import 'package:newui/widgets/description/cut_rectangle.dart';
import 'package:newui/widgets/description/datacut_rectangle.dart';
import 'package:newui/widgets/description/favourite.dart';

import 'body.dart'; 

class AboutStoryPage extends StatefulWidget {
  const AboutStoryPage({Key? key}) : super(key: key);

  @override
  _AboutStoryPageState createState() => _AboutStoryPageState();
}

class _AboutStoryPageState extends State<AboutStoryPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _DescriptionPage(
              minExtended: kToolbarHeight,
              maxExtended: size.height * 0.35,
              size: size,
            ),
          ),
          SliverToBoxAdapter(
            child: Body(size: size),
          ),
        ],
      ),
    );
  }
}

class _DescriptionPage extends SliverPersistentHeaderDelegate {
  const _DescriptionPage({
    required this.maxExtended,
    required this.minExtended,
    required this.size,
  });

  final double maxExtended;
  final double minExtended;
  final Size size;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percent = shrinkOffset / maxExtended;
    //validate angle at which card returns 
    final uploadlimit= 13/100;
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    final fixrotation = pow(percent, 1.5);

    final card = _CoverCard(size: size, 
          percent: percent,
          uploadlimit: uploadlimit,
          valueback: valueback);

    final bottomsliverbar = _CustomBottomSliverBar( 
      size : size,
      fixrotation: fixrotation,
      percent: percent,
    );

    return Container(
      child: Stack(
        children: [
          BackgroundSliver(),
          if (percent > uploadlimit) ...[ 
            card,
            bottomsliverbar,
          ] else ...[ 
            bottomsliverbar,
            card,
          ],
          ButtonBack( 
            size: size,
            percent: percent,
          ),
          Favourite( 
            size: size,
            percent: percent,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _CoverCard extends StatelessWidget {
  const _CoverCard({Key? key, required this.size, required this.percent, required this.uploadlimit, required this.valueback}) : super(key: key);
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;

  final double angleForCard = 6.5;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()..rotateZ(percent > uploadlimit ? (valueback * angleForCard) : percent * angleForCard),
        child: CoverPhoto(size: size),
      ),
    );
  }
}

class _CustomBottomSliverBar extends StatelessWidget {
  const _CustomBottomSliverBar({
    Key? key,
    required this.size,
    required this.fixrotation,
    required this.percent,
  }) : super(key: key);

  final Size size;
  final num fixrotation;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: -size.width * fixrotation.clamp(0, 0.35),
      right: 0,
      child: _CustomBottomSliver(
        size: size,
        percent: percent,
        ),
    );
  }
}

class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key );

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: CutRectangle(),
          ),
          DataCutRectangle(
            size: size,
            percent: percent,
            )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:newui/widgets/homescreen/slider.dart';

class SliverAppBarBldr extends StatelessWidget {
  const SliverAppBarBldr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      centerTitle: false,
      stretch: true,
      expandedHeight: 300.0,
      flexibleSpace: const FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: SliderScreen(),
        ),
    );
  }
}
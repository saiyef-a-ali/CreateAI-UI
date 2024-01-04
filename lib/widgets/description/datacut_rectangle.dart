import 'dart:math';
import 'package:flutter/material.dart';
import 'package:newui/widgets/description/name_description.dart';

class DataCutRectangle extends StatelessWidget {
  const DataCutRectangle({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key);

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    // Calculate padding values based on percent
    double leftPadding = percent > 0.13
        ? size.width * pow(percent.toDouble(), 5.5).clamp(0.0, 0.2).toDouble()
        : 0;
    double topPadding = size.height *
        (percent > 0.48
            ? pow(percent.toDouble(), 10.5).clamp(0.0, 0.06).toDouble()
            : 0.0);

    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.34 + leftPadding, top: 8 + topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Widget
          Text(
            "The Detective",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),

          // AnimatedOpacity Widget
          if (percent < 0.50) ...[
            const SizedBox(height: 2),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: 1.0 - pow(percent, 0.001),
              child: const nameDescription(),
            ),
          ]
        ],
      ),
    );
  }
}

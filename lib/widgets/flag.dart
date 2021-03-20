import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tunisia_independence_day/shapes/tunisian_flag.dart';

class Flag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xFFE70013),
      child: _flagBody(size),
    );
  }

  Widget _flagBody(Size size) => Center(
        child: Shimmer.fromColors(
          baseColor: Colors.white24,
          highlightColor: Colors.black38,
          child: Container(
            padding: EdgeInsets.only(left: 30),
            height: size.height * .25,
            width: size.height * .25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: CustomPaint(
                painter: TunisiaFlagPainter(),
              ),
            ),
          ),
        ),
      );
}

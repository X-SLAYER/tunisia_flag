import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tunisia_independence_day/utils/text_animation.dart';
import 'package:tunisia_independence_day/widgets/flag.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Flag(),
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Color(0xFFE70013),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100.0,
                    alignment: Alignment.topCenter,
                    child: TextMoving(
                      text: "Happy Independence Day",
                      scrollAxis: Axis.horizontal,
                      textStyle: GoogleFonts.lobster(
                          color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    alignment: Alignment.topCenter,
                    child: TextMoving(
                      text: "عيد استقلال سعيد",
                      scrollAxis: Axis.horizontal,
                      textStyle: GoogleFonts.reemKufi(
                          color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

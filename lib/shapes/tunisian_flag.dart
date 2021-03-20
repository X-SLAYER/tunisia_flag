import 'package:flutter/material.dart';
import 'dart:math' as math;

class TunisiaFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bx = 10;
    final by = 0;

    final paint = Paint();
    paint.color = Color(0xFFE70013);
    final innerCirclePoints = 5;
    final innerRadius = 80.0 / innerCirclePoints;
    final innerOuterRadiusRatio = 2.5;
    final outerRadius = innerRadius * innerOuterRadiusRatio;

    List<Map> points =
        calcStarPoints(bx, by, innerCirclePoints, innerRadius, outerRadius);
    var star = Path()..moveTo(points[0]['x'], points[0]['y']);
    points.forEach((point) {
      star.lineTo(point['x'], point['y']);
    });

    canvas.drawPath(
      Path.combine(
        PathOperation.union,

        //this combine the crescent and the star
        Path.combine(
          PathOperation.difference,
          Path()..addOval(Rect.fromCircle(center: Offset(-20, 0), radius: 75)),
          Path()
            ..addOval(Rect.fromCircle(center: Offset(4, 0), radius: 60))
            ..close(),
        ),
        star,
      ),
      paint,
    );
  }

  //This function is life saver.
//it produces points for star edges inner and outer. if you need to //rotation of star edges.
// just play with - 0.3  value in currX and currY equations.

  List<Map> calcStarPoints(
      centerX, centerY, innerCirclePoints, innerRadius, outerRadius) {
    final angle = ((math.pi) / innerCirclePoints);
    var angleOffsetToCenterStar = 0;

    var totalPoints = innerCirclePoints * 2; // 10 in a 5-points star
    List<Map> points = [];
    for (int i = 0; i < totalPoints; i++) {
      bool isEvenIndex = i % 2 == 0;
      var r = isEvenIndex ? outerRadius : innerRadius;

      var currY =
          centerY + math.cos(i * angle + angleOffsetToCenterStar - 0.3) * r;
      var currX =
          centerX + math.sin(i * angle + angleOffsetToCenterStar - 0.3) * r;
      points.add({'x': currX, 'y': currY});
    }
    return points;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

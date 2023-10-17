import 'dart:math';

import 'package:flutter/material.dart';

class CustomShape extends CustomPainter {
  CustomShape({required this.random});
  final Random random;
  final min = 0;
  final max = 50;

  Color generateRandomColor() {
    int red = random
        .nextInt(256); // Random value between 0 and 255 for the red component
    int green = random
        .nextInt(256); // Random value between 0 and 255 for the green component
    int blue = random
        .nextInt(256); // Random value between 0 and 255 for the blue component

    return Color.fromRGBO(
        red, green, blue, 0.5); // Create and return a random color
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = generateRandomColor()
      ..style = PaintingStyle.fill;

    // Define the points for the star shape
    var path = Path();
    path.moveTo(
        (min + random.nextInt(max - min)).toDouble(), 0); // Top-left point
    path.lineTo(size.width,
        (min + random.nextInt(max - min)).toDouble()); // Top-right point
    path.lineTo(size.width, size.height); // Bottom-left point
    path.lineTo((min + random.nextInt(max - min)).toDouble(),
        size.height); // Bottom-right point
    path.close(); // Close the path to create the shape

    // Draw the star on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

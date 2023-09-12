import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyPainter extends CustomPainter {
  double height;

  MyPainter({required this.height});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    var paint = Paint()
      ..color = Colors.blue.withOpacity(0.25)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(4))
      ..style = ui.PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, height * 0.25)
      ..addArc(
          Rect.fromCircle(
              center: Offset(height * 0.25, height * 0.25),
              radius: height * 0.25),
          degToRad(180).toDouble(),
          degToRad(90).toDouble())
      ..lineTo(size.width - height * 0.5, 0)
      ..addArc(
          Rect.fromCircle(
              center: Offset(size.width - height / 2, height / 2),
              radius: height / 2),
          degToRad(270).toDouble(),
          degToRad(90).toDouble())
      ..quadraticBezierTo(size.width - 7, 7, size.width - height / 2, 7)
      ..lineTo(height * 0.25, 7)
      ..quadraticBezierTo(5, 7, 4, height * 0.3)
      ..lineTo(0, height * 0.75)
      ..lineTo(0, height * 0.25);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  double degToRad(double degree) {
    return degree * (math.pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

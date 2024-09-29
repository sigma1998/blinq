import 'package:flutter/material.dart';

class CustomThumb extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(30.0, 30.0); // Preferred size for the thumb
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required Size sizeWithOverflow,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double textScaleFactor,
        required double value,
      }) {
    final canvas = context.canvas;

    // Draw the white circular thumb (30 radius)
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, 15.0, whitePaint); // Radius = 15.0

    // Draw the red circular thumb (10 radius) inside the white thumb
    final redPaint = Paint()..color = Colors.red;
    canvas.drawCircle(center, 5.0, redPaint); // Radius = 5.0
  }
}

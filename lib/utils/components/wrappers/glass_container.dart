import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final double tint;
  final bool border;
  final Color? tintColor;
  final Color? borderColor;
  final bool isCircle;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final bool solidBorder;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 20,
    this.radius = 24,
    this.padding,
    this.tint = 0.03,
    this.border = true,
    this.tintColor,
    this.borderColor,
    this.isCircle = false,
    this.borderRadius,
    this.constraints,
    this.solidBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final shape = isCircle ? BoxShape.circle : BoxShape.rectangle;
    final br = isCircle ? null : BorderRadius.circular(radius);

    Widget content = Container(
      padding: padding,
      alignment: Alignment.center,
      constraints: constraints,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius ?? br,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (tintColor ?? Colors.white).withValues(alpha: tint + 0.06),
            (tintColor ?? Colors.white).withValues(alpha: tint),
          ],
        ),
      ),
      child: child,
    );

    if (border) {
      content = CustomPaint(
        painter: _GlassEdgePainter(
          borderRadius: radius,
          isCircle: isCircle,
          borderColor: borderColor,
          solidBorder: solidBorder,
        ),
        child: content,
      );
    }

    if (isCircle) {
      return ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: content,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: content,
      ),
    );
  }
}

class _GlassEdgePainter extends CustomPainter {
  final double borderRadius;
  final bool isCircle;
  final Color? borderColor;
  final bool solidBorder;

  _GlassEdgePainter({
    required this.borderRadius,
    this.isCircle = false,
    this.borderColor,
    this.solidBorder = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final cx = size.width / 2;
    final cy = size.height / 2;

    final baseColor = borderColor ?? const Color(0xFFFFFFFF);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    if (solidBorder) {
      paint.color = baseColor;
    } else {
      double toStop(double x, double y) {
        final a = math.atan2(cy - y, x - cx);
        return a < 0 ? a / (2 * math.pi) + 1.0 : a / (2 * math.pi);
      }

      final tr = toStop(size.width, 0);
      final bl = toStop(0, size.height);
      const s = 0.08;
      final lo = math.min(tr, bl);
      final hi = math.max(tr, bl);

      final bright = baseColor.withValues(alpha: 0.376);
      final dim = baseColor.withValues(alpha: 0.063);

      final List<Color> colors;
      final List<double> stops;

      if (lo >= s) {
        colors = [dim, dim, bright, dim, dim, bright, dim, dim];
        stops = [0.0, lo - s, lo, lo + s, hi - s, hi, hi + s, 1.0];
      } else {
        colors = [bright, bright, dim, dim, bright, dim, dim, bright];
        stops = [0.0, lo, lo + s, hi - s, hi, hi + s, 1.0 + lo - s, 1.0];
      }

      paint.shader =
          SweepGradient(colors: colors, stops: stops).createShader(rect);
    }

    if (isCircle) {
      canvas.drawOval(rect.deflate(0.5), paint);
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect.deflate(0.5),
          Radius.circular(borderRadius),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GlassEdgePainter old) =>
      old.borderRadius != borderRadius ||
          old.isCircle != isCircle ||
          old.borderColor != borderColor ||
          old.solidBorder != solidBorder;
}
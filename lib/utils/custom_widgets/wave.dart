// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

class WaveWidget extends StatefulWidget {
  //
  final double scale;

  final bool animate;

  final void Function() onPressed;

  const WaveWidget({
    super.key,
    required this.onPressed,
    this.scale = 1,
    this.animate = false,
  });

  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  //
  final _scaleDuration = const Duration(milliseconds: 300);
  final _rotationDuration = const Duration(seconds: 5);

  late AnimationController _rotationController;
  late AnimationController _scaleController;

  double _rotationFactor = 0;
  double _scaleFactor = 0.70;

  @override
  void initState() {
    _rotationController =
        AnimationController(vsync: this, duration: _rotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();

    _scaleController =
        AnimationController(vsync: this, duration: _scaleDuration)
          ..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _updateRotation() =>
      _rotationFactor = _rotationController.value * 2 * pi;
  void _updateScale() => _scaleFactor = (_scaleController.value * 0.2) + 0.70;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: widget.animate,
          child: ScaleTransition(
            scale: _scaleController,
            child: Stack(
              children: [
                Blob(
                  rotation: _rotationFactor,
                  scale: _scaleFactor * (widget.scale * 0.02 + 1),
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.3),
                ),
                Blob(
                  rotation: _rotationFactor * 2 - 30,
                  scale: _scaleFactor * (widget.scale * 0.02 + 1),
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.4),
                ),
                Blob(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.5),
                  scale: _scaleFactor * (widget.scale * 0.02 + 1),
                  rotation: _rotationFactor * 3 - 45,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 76,
          height: 76,
          margin: const EdgeInsets.all(16),
          child: FloatingActionButton(
            onPressed: () {
              _scaleController.forward();

              widget.onPressed();
            },
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            child: Icon(
              widget.animate ? Icons.mic : Icons.mic_none,
              size: 48,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}

class Blob extends StatelessWidget {
  //
  final double rotation;
  final double scale;
  final Color color;

  const Blob({
    super.key,
    required this.color,
    this.rotation = 0,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(240),
              bottomLeft: Radius.circular(220),
              bottomRight: Radius.circular(180),
            ),
          ),
        ),
      ),
    );
  }
}

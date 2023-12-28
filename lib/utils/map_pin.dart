// Flutter imports:
import 'package:flutter/material.dart';

class MapPicker extends StatefulWidget {
  const MapPicker({
    Key? key,
    this.mapPickerController,
    this.showDot = true,
    this.iconWidget = const Icon(
      Icons.location_on,
      size: 48,
    ),
    this.padding = const EdgeInsets.symmetric(),
  }) : super(key: key);

  final MapPickerController? mapPickerController;
  final bool showDot;
  final Widget iconWidget;
  final EdgeInsetsGeometry padding;

  @override
  MapPickerState createState() => MapPickerState();
}

class MapPickerState extends State<MapPicker>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> translateAnimation;

  static const double dotRadius = 2.5;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 300),
    );

    widget.mapPickerController?.mapMoving = mapMoving;
    widget.mapPickerController?.mapFinishedMoving = mapFinishedMoving;

    translateAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding.add(const EdgeInsets.only(bottom: 0)),
      child: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, snapshot) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (widget.showDot)
                  Container(
                    width: dotRadius,
                    height: dotRadius,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(dotRadius)),
                  ),
                Transform.translate(
                  offset: Offset(0, -15 * translateAnimation.value),
                  child: widget.iconWidget,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void mapMoving() {
    if (!animationController.isAnimating && !animationController.isCompleted) {
      animationController.forward();
    }
  }

  void mapFinishedMoving() {
    animationController.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}

class MapPickerController {
  void Function()? mapMoving;
  void Function()? mapFinishedMoving;

  MapPickerController({this.mapMoving, this.mapFinishedMoving});
}

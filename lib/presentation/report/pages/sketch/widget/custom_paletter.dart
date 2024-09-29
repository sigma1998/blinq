import 'package:flutter/material.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';

import '../../../../../utils/components/slider/thumb/custom_thumb.dart';

class CustomPalette extends StatefulWidget {
  final List<Color> colors;
  final PainterController painterController;

  const CustomPalette({
    super.key,
    required this.colors,
    required this.painterController,
  });

  @override
  State<CustomPalette> createState() => _CustomPaletteState();
}

class _CustomPaletteState extends State<CustomPalette> {
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(
                  colors: widget.colors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: CustomThumb(), // Use the custom thumb
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
              trackHeight: 4.0,
            ),
            child: Slider(
              value: val,
              max: 89,
              min: 0,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
              thumbColor: Colors.white,
              onChanged: (double val) {
                setState(() {
                  this.val = val;
                  widget.painterController.freeStyleColor =
                      widget.colors[val ~/ 10];
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  getIndex(int val) {}
}

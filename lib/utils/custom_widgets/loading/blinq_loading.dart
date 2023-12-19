import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BlinqLoading extends StatelessWidget {
  //
  final List<Widget>? children;

  const BlinqLoading({
    super.key,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppDrawables.blinqLoadingAnim,
          ),
          if (children != null) ...[
            const SizedBox(height: 20),
            ...children!,
          ],
        ],
      ),
    );
  }
}

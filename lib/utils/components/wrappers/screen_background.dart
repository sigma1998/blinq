import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class ScreenBackground extends StatelessWidget {
  final Widget body;
  final bool bottom;
  final bool darBackground;
  final Widget? floatingActionButton;
  final Widget? appBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const ScreenBackground({
    super.key,
    required this.body,
    this.bottom = true,
    this.darBackground = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation, this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Image.asset(darBackground ? Assets.imagesDarkBg : Assets.imagesBg),
            ],
          ),
          SafeArea(bottom: bottom, child: Column(
            children: [
              if(appBar != null) appBar ?? SizedBox(),
              Expanded(child: body),
            ],
          )),
          Positioned(bottom: 8,right: 0,left: 0,child: SafeArea(child: floatingActionButton ?? SizedBox()))
        ],
      ),
    );
  }
}

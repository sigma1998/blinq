import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  //
  final Color color;
  final double? h;

  const Loading({
    super.key,
    this.h,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(color: color,)
          : CircularProgressIndicator(color: color),
    );
  }
}

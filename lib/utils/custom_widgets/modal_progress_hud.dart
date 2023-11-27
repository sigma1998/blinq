import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:flutter/material.dart';

class ModalProgressHud extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ModalProgressHud(
      {Key? key, required this.child, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if(isLoading)
          const Loading()
      ],
    );
  }
}

import 'package:flutter/material.dart';

Future<dynamic> showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
}) async {
  return await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    builder: (_) {
      return child;
    },
  );
}

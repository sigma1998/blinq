import 'package:flutter/material.dart';

Future<dynamic> showCustomDialog({
  required BuildContext context,
  required Widget child,
}) async {
  return await showDialog(
    context: context,
    builder: (_) {
      return child;
    },
  );
}

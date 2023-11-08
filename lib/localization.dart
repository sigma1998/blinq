// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

class MyLocalization extends StatefulWidget {
  //
  final Widget child;

  const MyLocalization({super.key, required this.child});

  @override
  State<MyLocalization> createState() => _MyLocalizationState();
}

class _MyLocalizationState extends State<MyLocalization> {
  //
  final list = [
    const Locale('en'),
    const Locale('hu'),
  ];

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      saveLocale: false,
      path: 'assets/locale',
      useOnlyLangCode: true,
      supportedLocales: list,
      child: widget.child,
    );
  }
}

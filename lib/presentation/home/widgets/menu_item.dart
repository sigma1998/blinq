// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class HomeScreenMenuItem extends StatelessWidget {
  //
  final String text;
  final String? icon;

  final VoidCallback onTap;

  final double padding;
  final String? background;

  const HomeScreenMenuItem({
    super.key,
    required this.text,
    required this.onTap,
    //
    this.icon,
    this.padding = 24,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      onTap: onTap,
      height: 160,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          if (background != null)
            SvgPicture.asset(
              background!,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (icon != null)
                  SvgPicture.asset(
                    icon!,
                    height: 55,
                  ),
                Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

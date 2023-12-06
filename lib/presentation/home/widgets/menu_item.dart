// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenMenuItem extends StatelessWidget {
  //
  final VoidCallback onTap;
  final String? icon;
  final String text;
  final double padding;
  final String? background;

  const HomeScreenMenuItem({
    super.key,
    required this.text,
    this.padding = 24,
    this.background,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Stack(
          children: [
            if (background != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SvgPicture.asset(
                  background!,
                  fit: BoxFit.cover,
                ),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

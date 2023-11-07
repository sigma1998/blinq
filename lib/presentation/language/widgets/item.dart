// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class LanguageItem extends StatelessWidget {
  //
  final String title;
  final VoidCallback onSelect;

  final bool isLoading;
  final bool isSelected;

  const LanguageItem({
    super.key,
    required this.title,
    required this.onSelect,
    //
    this.isLoading = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? null : onSelect,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            if (isLoading && !isSelected)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            if (isSelected)
              SvgPicture.asset(
                AppDrawables.tick,
                width: 16,
                height: 16,
                fit: BoxFit.contain,
              ),
          ],
        ),
      ),
    );
  }
}

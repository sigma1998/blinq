// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class HomeInfoFaqItem extends StatefulWidget {
  //
  final String title;
  final String description;

  const HomeInfoFaqItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<HomeInfoFaqItem> createState() => _HomeInfoFaqItemState();
}

class _HomeInfoFaqItemState extends State<HomeInfoFaqItem> {
  //
  bool isExpanded = false;

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyInkWell(
          onTap: onExpand,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SvgPicture.asset(
                isExpanded ? AppDrawables.arrowDown : AppDrawables.arrowRight,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        ExpandedSection(
          expand: isExpanded,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onExpand() {
    isExpanded = !isExpanded;
    updateState();
  }
}

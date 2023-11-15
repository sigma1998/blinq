// Flutter imports:
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class PremadeMessageItem extends StatefulWidget {
  //
  final String title;
  final String message;

  const PremadeMessageItem({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  State<PremadeMessageItem> createState() => _PremadeMessageItemState();
}

class _PremadeMessageItemState extends State<PremadeMessageItem> {
  //
  bool isExpanded = false;

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      onTap: onExpand,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: isExpanded
                        ? Theme.of(context).colorScheme.outline
                        : Colors.white,
                  ),
                ),
              ),
              if (isExpanded)
                SvgPicture.asset(
                  AppDrawables.edit,
                  width: 20,
                  height: 20,
                ),
            ],
          ),
          ExpandedSection(
            expand: isExpanded,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.message,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onExpand() {
    isExpanded = !isExpanded;
    updateState();
  }
}

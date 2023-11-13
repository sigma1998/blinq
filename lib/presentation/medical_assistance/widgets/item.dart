// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class MedicalAssistanceItem extends StatefulWidget {
  //
  final String title;
  final String subtitle;

  const MedicalAssistanceItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<MedicalAssistanceItem> createState() => _MedicalAssistanceItemState();
}

class _MedicalAssistanceItemState extends State<MedicalAssistanceItem> {
  //
  bool _isExpanded = false;

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onExpand,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SvgPicture.asset(
                _isExpanded ? AppDrawables.arrowDown : AppDrawables.arrowRight,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        ExpandedSection(
          expand: _isExpanded,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  void onExpand() {
    _isExpanded = !_isExpanded;
    updateState();
  }
}

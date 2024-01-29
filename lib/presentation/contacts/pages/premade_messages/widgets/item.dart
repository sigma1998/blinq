// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class PremadeMessageItem extends StatefulWidget {
  //
  final PreMadeMessageResponseModel premadeMessage;
  final void Function(int?) onEdit;

  const PremadeMessageItem({
    super.key,
    required this.premadeMessage,
    required this.onEdit,
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
                  widget.premadeMessage.title ?? '',
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
                GestureDetector(
                  onTap: () => widget.onEdit(widget.premadeMessage.id),
                  child: SvgPicture.asset(
                    AppDrawables.edit,
                    width: 20,
                    height: 20,
                  ),
                ),
            ],
          ),
          ExpandedSection(
            expand: isExpanded,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  widget.premadeMessage.message ?? '',
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

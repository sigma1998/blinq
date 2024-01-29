// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class PremadeMessageSelectorItem extends StatelessWidget {
  //
  final PreMadeMessageResponseModel premadeMessage;

  final bool isSelected;
  final void Function()? onTap;

  const PremadeMessageSelectorItem({
    super.key,
    required this.premadeMessage,
    //
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      color: isSelected
          ? Theme.of(context).colorScheme.onSecondary
          : Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            premadeMessage.title ?? '',
            maxLines: 2,
            style: isSelected
                ? Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    )
                : Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
          ),
          const SizedBox(height: 24),
          Text(
            premadeMessage.message ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: isSelected
                ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    )
                : Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
          ),
        ],
      ),
    );
  }
}

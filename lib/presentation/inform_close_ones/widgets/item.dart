// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/default_checkbox.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/url_helper.dart';

class InformCloseOnesItem extends StatelessWidget {
  //
  final String fullName;
  final String imageUrl;
  final String phoneNumber;

  final bool isChecked;
  final void Function(bool?) onChanged;

  const InformCloseOnesItem({
    super.key,
    required this.fullName,
    required this.imageUrl,
    required this.phoneNumber,
    //
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          MyCheckbox(
            isChecked: isChecked,
            onChanged: onChanged,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: MyInfoContainer(
              color: isChecked
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 28,
              ),
              child: Row(
                children: [
                  MyImage(
                    imageUrl,
                    width: 54,
                    height: 54,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    fullName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Expanded(child: SizedBox(width: 16)),
                  GestureDetector(
                    onTap: onCall,
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(8),
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isChecked
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                      child: SvgPicture.asset(
                        AppDrawables.phone,
                        width: 21,
                        height: 21,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCall() => MyUrlLauncher.call(phoneNumber);
}

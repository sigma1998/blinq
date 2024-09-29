// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/items/name_first_letter.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';

class InformCloseOnesItem extends StatelessWidget {
  //
  final ContactResponseModel contact;

  final bool isChecked;
  final bool showPhone;
  final void Function(bool?) onChanged;
  final void Function(String) onPhoneCall;
  final VoidCallback onSmsSend;

  const InformCloseOnesItem({
    super.key,
    required this.contact,
    //
    required this.isChecked,
    required this.onChanged,
    required this.onPhoneCall,
    this.showPhone = true,
    required this.onSmsSend,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged.call(!isChecked);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 6,
          right: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: isChecked,
              onChanged: (bool? val) {
                onChanged.call(!isChecked);
              },
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      (contact.image?.isNotEmpty ?? false)
                          ? MyImage(
                              contact.image ?? '',
                              width: 44,
                              height: 44,
                            )
                          : NameFirstLetter(name: contact.fullName),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          contact.fullName,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.s17W400,
                        ),
                      ),
                      const SizedBox(width: 2),
                      MyInkWell(
                        padding: const EdgeInsets.all(0),
                        borderRadius: BorderRadius.circular(100),
                        onTap: onSmsSend,
                        color: isChecked
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.onSecondary,
                        child: SvgPicture.asset(AppDrawables.messageYellow),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: showPhone ? 12 : 0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: showPhone ? 36 : 0,
                        height: showPhone ? 36 : 0,
                        child: MyInkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () => onPhoneCall(contact.phoneNumber ?? ''),
                          color: isChecked
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.onSecondary,
                          child: SvgPicture.asset(AppDrawables.phoneRed),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.darkGrey,
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

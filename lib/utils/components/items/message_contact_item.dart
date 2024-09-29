import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/items/name_first_letter.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:flutter/material.dart';

import '../../../data/model/contact/response/contact_response_model.dart';

class MessageContactItem extends StatelessWidget {
  final ContactResponseModel contact;
  final VoidCallback onTap;

  const MessageContactItem({
    super.key,
    required this.contact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.check,
                  size: 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      (contact.image?.isNotEmpty ?? false) ? MyImage(
                        contact.image ?? '',
                        width: 44,
                        height: 44,
                      ) : NameFirstLetter(name: contact.firstName),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          contact.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.s17W400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.darkGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

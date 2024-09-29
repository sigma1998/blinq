import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/items/message_contact_item.dart';
import 'package:blinq/utils/components/items/name_first_letter.dart';
import 'package:flutter/material.dart';

import '../../../data/model/contact/response/contact_response_model.dart';
import '../../../utils/custom_widgets/default_image.dart';

class ImagesSection extends StatefulWidget {
  final List<ContactResponseModel> selectedContacts;
  final Function onRemoveTap;

  const ImagesSection({
    super.key,
    required this.selectedContacts,
    required this.onRemoveTap,
  });

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  bool opened = false;
  bool fullyOpened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.grey1)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'To:',
                style: AppTextStyles.s16W400.copyWith(color: AppColors.grey2),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Stack(
                  children: Iterable.generate(getLength()).map<Widget>((e) {
                    return e == 5
                        ? Padding(
                            padding: EdgeInsets.only(left: e * 22.0),
                            child: Container(
                              width: 44,
                              height: 44,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.grey2,
                              ),
                              child: const Text(
                                '+4',
                                style: AppTextStyles.s17W400,
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(left: e * 22.0),
                            child: (widget.selectedContacts[e].image
                                        ?.isNotEmpty ??
                                    false)
                                ? MyImage(
                                    widget.selectedContacts[e].image ?? '',
                                    width: 44,
                                    height: 44,
                                  )
                                : NameFirstLetter(
                                    name: widget.selectedContacts[e].fullName),
                          );
                  }).toList(),
                ),
              ),
              if (widget.selectedContacts.length == 1)
                Expanded(
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    widget.selectedContacts.first.fullName,
                    style: AppTextStyles.s17W400,
                  ),
                ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (opened) {
                      opened = false;
                      fullyOpened = false;
                    } else {
                      opened = true;
                    }
                  });
                },
                icon: AnimatedRotation(
                  turns: opened ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            onEnd: () {
              if (opened) {
                setState(() {
                  fullyOpened = true;
                });
              }
            },
            duration: const Duration(milliseconds: 200),
            height: opened ? widget.selectedContacts.length * 87 : 0,
            child: ListView.builder(
              itemCount: widget.selectedContacts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return MessageContactItem(
                  contact: widget.selectedContacts[index],
                  onTap: () {
                    widget.onRemoveTap.call(widget.selectedContacts[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int getLength() {
    if (widget.selectedContacts.length > 5) {
      return 6;
    }
    return widget.selectedContacts.length;
  }
}

// Flutter imports:x
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/url_helper.dart';

class ContactItem extends StatefulWidget {
  //
  final String imageUrl;
  final String fullName;

  final String phoneNumber;

  const ContactItem({
    super.key,
    required this.imageUrl,
    required this.fullName,
    required this.phoneNumber,
  });

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyImage(
                      widget.imageUrl,
                      width: 54,
                      height: 54,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.fullName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onPhoneCall,
                      child: SvgPicture.asset(
                        AppDrawables.phoneCircle,
                        width: 36,
                        height: 36,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: onMessage,
                      child: SvgPicture.asset(
                        AppDrawables.message,
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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

  void onPhoneCall() => MyUrlLauncher.call(widget.phoneNumber);

  void onMessage() => MyUrlLauncher.message(widget.phoneNumber);
}

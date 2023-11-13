// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class EmergencyServicesItem extends StatelessWidget {
  //
  final String icon;
  final String title;

  final void Function()? onTap;

  const EmergencyServicesItem({
    super.key,
    required this.icon,
    required this.title,
    //
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          MyInfoContainer(
            width: double.infinity,
            color: Theme.of(context).colorScheme.outline,
            child: const SizedBox(height: 68),
          ),
          Row(
            children: [
              Expanded(
                child: MyInfoContainer(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 24,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icon,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(
                AppDrawables.phone,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 24),
            ],
          ),
        ],
      ),
    );
  }
}

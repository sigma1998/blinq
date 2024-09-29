import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';

class ConnectedDeviceItem extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDisconnect;
  final DiscoveredDevice? device;

  const ConnectedDeviceItem({
    super.key,
    required this.onEdit,
    required this.onDisconnect,
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.17),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black,
                ),
                child: SvgPicture.asset(
                  AppDrawables.bluetoothIcon,
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.s17W600,
                    ),
                    Text(
                      'Connected',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.s15W400.copyWith(
                        color: AppColors.grey2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: RegularButton(
                  onTap: onEdit,
                  background: AppColors.black,
                  padding: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppDrawables.edit2,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Edit',
                        style: AppTextStyles.s15W600,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RegularButton(
                  onTap:  onDisconnect,
                  padding: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppDrawables.power,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Disconnect',
                        style: AppTextStyles.s15W600,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

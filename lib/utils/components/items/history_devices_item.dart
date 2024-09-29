import 'package:blinq/presentation/connect_to_blinq/widgets/discovered_ble_devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../buttons/regular_button.dart';

class HistoryDevicesItem extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onLink;
  final DiscoveredDevice device;
  final bool isConnected;

  const HistoryDevicesItem({
    super.key,
    required this.onEdit,
    required this.onLink,
    required this.device,
    required this.isConnected,
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
                  colorFilter: ColorFilter.mode(
                    AppColors.white.withOpacity(0.17),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  device.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s17W600,
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
          const SizedBox(height: 24),
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
                  onTap: onLink,
                  background: AppColors.activeReportColor,
                  padding: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppDrawables.link,
                        width: 16,
                        height: 16,

                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Connect',
                        style: AppTextStyles.s15W600.copyWith(
                          color: AppColors.black,
                        ),
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

import 'package:blinq/presentation/connect_to_blinq/widgets/discovered_ble_devices.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
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
    return GlassContainer(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: GlassContainer(
                  isCircle: true,
                  tint: 0.15,
                  child: SvgPicture.asset(
                    AppDrawables.bluetoothIcon,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
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
                child: GlassButton(
                  onTap: onEdit,
                  title: 'Edit',
                  tint: 0.10,
                  radius: 12,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GlassButton(
                  onTap: onLink,
                  title: 'Connect',
                  backgroundColor: AppColors.primaryColor,
                  tint: 0.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

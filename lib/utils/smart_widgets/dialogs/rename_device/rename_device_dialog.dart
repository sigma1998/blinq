// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/rounded_text_field.dart';
import 'package:blinq/utils/services/local_storage/shared_preferences.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/navigation_service.dart';

class RenameDeviceDialog extends StatefulWidget {
  //
  final DiscoveredDevice device;

  const RenameDeviceDialog({
    super.key,
    required this.device,
  });

  @override
  State<RenameDeviceDialog> createState() => _RenameDeviceDialogState();
}

class _RenameDeviceDialogState extends State<RenameDeviceDialog> {
  //
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.device.name);
  }

  DiscoveredDevice get updatedDevice {
    return DiscoveredDevice(
      name: controller.text,
      serviceUuids: widget.device.serviceUuids,
      rssi: widget.device.rssi,
      manufacturerData: widget.device.manufacturerData,
      serviceData: widget.device.serviceData,
      id: widget.device.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      padding: const EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height * 0.426,
      margin: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        children: [
          SvgPicture.asset(
            AppDrawables.blinqBloothooth,
            colorFilter: const ColorFilter.mode(
              Colors.green,
              BlendMode.srcATop,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'strRenameDevice'.tr(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 24),
          RoundedTextField(
            controller: controller,
          ),
          const SizedBox(height: 16),
          MyButton.secondary(
            onTap: onRename,
            label: 'strRename'.tr(),
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void onRename() {
    LocalStorageService().renameSavedDevice(updatedDevice);
    NavigationService.back();
  }
}

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';

import 'widgets/sections/car_policy/car_policy_section.dart';
import 'widgets/sections/user_info/user_info_section.dart';
import 'widgets/sections/vehicle/vehicle_section.dart';

class ProfileScreen extends StatelessWidget {
  //
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 38),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyImage(
                  'https://wellgroomedgentleman.com/wp-content/uploads/2023/10/tony-stark-beard.original.jpg',
                  width: 86,
                  height: 86,
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Tony Stark',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const ProfileUserInfoSection(),
            const SizedBox(height: 54),
            const ProfileVehicleSection(),
            const SizedBox(height: 54),
            const ProfileCarPolicySection(),
            const SizedBox(height: 54),
            const SafeArea(
              top: false,
              child: SizedBox(height: 16),
            ),
          ],
        ),
      ),
    );
  }
}

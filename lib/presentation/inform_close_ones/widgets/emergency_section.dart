import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmergencySection extends StatelessWidget {
  const EmergencySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: AppColors.darkGrey,
        ),
        child: Column(
          children: [
            const Text(
              'Universal number',
              style: AppTextStyles.s13W400,
            ),
            const SizedBox(height: 8),
            const Text(
              '112',
              style: AppTextStyles.s34W600,
            ),
            const SizedBox(height: 8),
            RegularButton(
              padding: 0,
              onTap: () {
                MyUrlLauncher.call('112');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    width: 16,
                    height: 16,
                    AppDrawables.phone,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Call',
                    style: AppTextStyles.s17W600,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: AppColors.black,
              ),
            ),
            getItem(
              text: 'Police',
              iconPath: AppDrawables.police,
              onTap: () {
                MyUrlLauncher.call('107');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: AppColors.black,
              ),
            ),
            getItem(
              text: 'Fire fighters',
              iconPath: AppDrawables.fire,
              onTap: () {
                MyUrlLauncher.call('105');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: AppColors.black,
              ),
            ),
            getItem(
              text: 'Ambulance',
              iconPath: AppDrawables.ems,
              onTap: () {
                MyUrlLauncher.call('104');
              },
            )
          ],
        ),
      ),
    );
  }

  getItem({
    required String text,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.s17W400,
            ),
          ),
          SvgPicture.asset(
            width: 36,
            height: 36,
            AppDrawables.phoneRed,
          )
        ],
      ),
    );
  }
}

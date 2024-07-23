import 'package:blinq/core/locale/app_locale.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddContactDialog extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onImport;

  const AddContactDialog({
    super.key,
    required this.onEdit,
    required this.onImport,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(46),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      size: 36,
                      Icons.close_rounded,
                      color: AppColors.grey2,
                    ),
                  )
                ],
              ),
               Text(
                AppLocale.addEmergencyContacts.tr(),
                style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: onImport,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey2,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child:  Text(
                    AppLocale.chooseFromMyContacts.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: onEdit,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    AppLocale.createNewOne.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ],
    );
  }
}

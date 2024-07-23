// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Project imports:

import '../../../../app/locator.dart';
import '../../../../data/model/driver_license/driver_license_model/license_model.dart';
import '../../../custom_widgets/buttons/default_ink_well.dart';
import '../../../custom_widgets/info_container.dart';
import '../../../services/db/driving_license_type.dart';

class LicenseCategoryDialog extends StatefulWidget {
  final List<String> items;
  final List<String>? chosenItems;

  const LicenseCategoryDialog({
    super.key,
    required this.items,
    required this.chosenItems,
  });

  @override
  State<LicenseCategoryDialog> createState() => _LicenseCategoryDialogState();
}

class _LicenseCategoryDialogState extends State<LicenseCategoryDialog> {
  List<LicenseModel> values = [];

  loadLicenses() async {
    final db = getIt<DrivingLicenceTypeDb>();
    final list = await db.values();
    values.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return MyLicenseDialog(items: widget.items, chosenItems: widget.chosenItems,);
  }
}

class MyLicenseDialog extends StatefulWidget {
  //
  final List<String> items;
  final List<String>? chosenItems;

  const MyLicenseDialog({
    super.key,
    required this.items,
    required this.chosenItems,
  });

  @override
  State<MyLicenseDialog> createState() => _MyLicenseDialogState();
}

class _MyLicenseDialogState extends State<MyLicenseDialog> {
  //
  List<String> filteredItems = [];
  List<String> chosenItems = [];

  final _controller = TextEditingController();

  @override
  void initState() {
    filteredItems = widget.items;
    _controller.addListener(_onSearchTextChanged);
    chosenItems.addAll(widget.chosenItems ?? []);
    super.initState();
  }

  void _onSearchTextChanged() {
    final searchText = _controller.text.toLowerCase();

    filteredItems = List.of(widget.items
        .where((item) => item.toLowerCase().contains(searchText))
        .toList());

    updateState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    _controller.removeListener(_onSearchTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      height: 600,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey1,
                ),
              ),
              child: Text(
                chosenItems.join(', '),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.42,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyInkWell(
                      onTap: () {
                        setState(() {
                          if (chosenItems.contains(item)) {
                            chosenItems.remove(item);
                          } else {
                            if(item.isEmpty) return;
                            chosenItems.add(item);
                          }
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 14,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 40,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          chosenItems.contains(item)
                              ? getClicked()
                              : getUnClicked()
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      indent: 14,
                      thickness: 1,
                      endIndent: 14,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: chosenItems.isNotEmpty
                    ? AppColors.primaryColor
                    : AppColors.grey1,
              ),
              onPressed: () {
                if (chosenItems.isEmpty) return;
                Navigator.of(context).pop(chosenItems);
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getClicked() {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: const Icon(
        Icons.check,
        size: 22,
      ),
    );
  }

  getUnClicked() {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

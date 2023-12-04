// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/search_text_field.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'item.dart';

class MyDialog extends StatefulWidget {
  //
  final List<String> items;

  const MyDialog({
    super.key,
    required this.items,
  });

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  //
  List<String> filteredItems = [];

  final _controller = TextEditingController();

  @override
  void initState() {
    filteredItems = widget.items;
    _controller.addListener(_onSearchTextChanged);
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
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SearchTextField(
              controller: _controller,
              hintText: 'strSearch'.tr(),
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

                return DialogItem(
                  title: item,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

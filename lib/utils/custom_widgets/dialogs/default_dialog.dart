// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/search_text_field.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'item.dart';

class MyDialog extends StatelessWidget {
  // открывать в блоке и передавать
  // countires list widget - свой блок - только за страны отвечает, snap widgets. parentID
  final List<String> items;

  final void Function(String) onChanged;
  final TextEditingController controller;

  const MyDialog({
    super.key,
    required this.items,
    //
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: SearchTextField(
              onChanged: onChanged,
              controller: controller,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.42,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final item = items[index];

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

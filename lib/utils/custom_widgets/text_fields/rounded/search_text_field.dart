// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/rounded_text_field.dart';

class SearchTextField extends StatelessWidget {
  //
  final String? hintText;

  final void Function(String)? onChanged;
  final TextEditingController controller;

  final FocusNode? focusNode;

  const SearchTextField({
    super.key,
    required this.controller,
    this.onChanged,
    //
    this.hintText,
    //
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedTextField(
      key: key,
      isOutlined: true,
      hintText: hintText,
      onChanged: onChanged,
      focusNode: focusNode,
      controller: controller,
      textInputAction: TextInputAction.search,
    );
  }

  void onClear() {
    controller.clear();
    onChanged?.call('');
  }
}

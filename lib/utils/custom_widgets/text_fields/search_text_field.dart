// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';

class SearchTextField extends StatelessWidget {
  //
  final String? hintText;
  final void Function(String) onChanged;
  final TextEditingController controller;

  final FocusNode? focusNode;

  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.controller,
    //
    this.hintText,
    //
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldRoundedWidget(
      key: key,
      hint: hintText,
      suffix: suffixIcon,
      onChanged: onChanged,
      focusNode: focusNode,
      textController: controller,
      inputAction: TextInputAction.search,
    );
  }

  Widget get suffixIcon {
    return GestureDetector(
      onTap: onClear,
      child: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          CupertinoIcons.xmark_circle,
          size: 28,
          color: Colors.grey,
        ),
      ),
    );
  }

  void onClear() {
    controller.clear();
    onChanged.call('');
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/drawables/app_text_styles.dart';

class SelectAll extends StatefulWidget {
  final Function selectAll;
  final bool selectedAll;

  const SelectAll({
    super.key,
    required this.selectAll,
    required this.selectedAll,
  });

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {


  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.selectAll.call(!widget.selectedAll);
        });
      },
      icon: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            value: widget.selectedAll,
            onChanged: (bool? val) {
              setState(() {
                widget.selectAll.call(!widget.selectedAll);
              });
            },
          ),
          const SizedBox(width: 12),
          const Text(
            'Select all',
            style: AppTextStyles.s17W400,
          ),
        ],
      ),
    );
  }
}

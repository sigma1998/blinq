// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

import 'action_buttons.dart';

class EditCard extends StatelessWidget {
  //
  final List<Widget> children;

  final int? id;

  final bool isLoading;

  final void Function() onNavigateBack;
  final void Function() onSave;
  final void Function() onDelete;

  const EditCard({
    super.key,
    required this.children,
    required this.isLoading,
    //
    required this.onNavigateBack,
    required this.onSave,
    required this.onDelete,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            MyInfoContainer(
              isEdit: true,
              isLoading: isLoading,
              onClose: onNavigateBack,
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.81,
              margin: const EdgeInsets.all(16).copyWith(top: 0),
              child: Column(
                children: [
                  ...children,
                ],
              ),
            ),
            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: EditorActionButtons(
                id: id,
                onSave: onSave,
                onDelete: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

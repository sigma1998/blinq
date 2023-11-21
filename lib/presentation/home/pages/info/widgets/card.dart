// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/presentation/home/pages/info/info_bloc.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class HomeInfoCard extends StatelessWidget {
  //
  final String title;

  final List<Widget> children;

  const HomeInfoCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = HomeInfoBloc();

    return SafeArea(
      child: MyInfoContainer(
        title: title,
        isEdit: true,
        onClose: bloc.onNavigateBack,
        margin: const EdgeInsets.all(16).copyWith(top: 0),
        closeButtonColor: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            ...children,
          ],
        ),
      ),
    );
  }
}

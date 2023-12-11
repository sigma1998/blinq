// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class ProfileReportCard extends StatelessWidget {
  //
  const ProfileReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return MyInfoContainer(
      onTap: bloc.onReportsPressed,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            SvgPicture.asset(AppDrawables.pdf),
            const SizedBox(width: 16),
            Text(
              'strReports'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Expanded(child: SizedBox(width: 16)),
            SvgPicture.asset(AppDrawables.arrowRight),
          ],
        ),
      ),
    );
  }
}

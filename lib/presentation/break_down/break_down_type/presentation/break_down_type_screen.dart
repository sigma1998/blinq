import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/utils/components/app_bar/only_back_app_bar.dart';
import 'package:blinq/utils/components/items/break_down_type_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/locator.dart';
import '../../../../domain/bloc/report_bloc/report_bloc.dart';
import '../../../../domain/repositories/accident_repository.dart';
import '../../../../domain/repositories/profile_repository.dart';
import '../../../../utils/generic_bloc_state.dart';
import '../../../../utils/navigation_service.dart';
import '../../../create_report/bloc/create_report_bloc.dart';
import '../../../create_report/create_report_screen.dart';


class BreakDownTypeScreen extends StatefulWidget {
  static const route = '/BreakDownTypeScreen';

  const BreakDownTypeScreen({super.key});

  @override
  State<BreakDownTypeScreen> createState() => _BreakDownTypeScreenState();
}

class _BreakDownTypeScreenState extends State<BreakDownTypeScreen> {
  late final CreateReportBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = CreateReportBloc(
      profileRepository: getIt<ProfileRepositoryImpl>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: BlocBuilder<CreateReportBloc, GenericBlocState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            children: [
              const Text(
                'Breakdown',
                style: AppTextStyles.s34W600,
              ),
              const SizedBox(height: 4),
              const Text(
                'Select the cause of the failure',
                style: AppTextStyles.s15W400,
              ),
              const SizedBox(height: 32),
              BreakDownTypeItem(
                iconPath: AppDrawables.flatTire,
                text: 'Flat tire',
                onTap: bloc.onCreateReportPressed,
              ),
              BreakDownTypeItem(
                iconPath: AppDrawables.fuel,
                text: 'Fuel',
                onTap: bloc.onCreateReportPressed,
              ),
              BreakDownTypeItem(
                iconPath: AppDrawables.engine,
                text: 'Engine problem',
                onTap: bloc.onCreateReportPressed,
              ),
            ],
          );
        },
      ),
    );
  }

  onTap() async {
    await NavigationService.pushNamed(
      routeName: CreateReportScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }
}

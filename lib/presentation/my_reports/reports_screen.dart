// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/my_reports/widgets/views/breakdown_view.dart';
import 'package:blinq/presentation/my_reports/widgets/views/accident_view.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/reports_screen_event.dart';
import 'bloc/reports_screen_state.dart';
import 'bloc/reports_screen_bloc.dart';
import 'widgets/tab_bar.dart';

class ReportsScreen extends StatefulWidget {
  //
  static const route = '/reports';

  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  //
  late ReportsScreenBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = ReportsScreenBloc(
      repository: getIt<ProfileRepositoryImpl>(),
      reportBloc: context.read(),
      mainScreenBloc: context.read(),
    );
    bloc.add(OnInit());

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ReportsScreenBloc, ReportsScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              title: 'strReports'.tr(),
            ),
            body: state.status == Status.loading
                ? const Loading()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        ReportsScreenTabBar(
                          index: state.pageIndex,
                          onFirstTabPressed: () =>
                              bloc.add(OnTabBarChanged(index: 0)),
                          onSecondTabPressed: () =>
                              bloc.add(OnTabBarChanged(index: 1)),
                        ),
                        state.pageIndex == 0
                            ? const Expanded(
                                child: AccidentReportsView(),
                              )
                            : const Expanded(
                                child: BreakdownReportsView(),
                              )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reports_screen_bloc.dart';
import 'reports_screen_event.dart';
import 'reports_screen_state.dart';
import 'widgets/items/report_item.dart';
import 'widgets/tab_bar.dart';

class ReportsScreen extends StatefulWidget {
  static const route = '/reports';

  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late ReportsScreenBloc bloc;

  @override
  void initState() {
    bloc = ReportsScreenBloc(repository: getIt<ProfileRepositoryImpl>());
    bloc.add(OnInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsScreenBloc, ReportsScreenState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            title: 'strReports'.tr(),
          ),
          body: state.status == Status.loading
              ? const Loading()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
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
                              bloc.add(OnTabBarChanged(index: 1))),
                      state.pageIndex == 0
                          ? Expanded(
                              child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 21),
                                  itemBuilder: (context, index) {
                                    return ProfileReportItem(
                                      historyItemModelDto:
                                          state.accidents[index],
                                      onDelete: () => bloc.add(
                                        OnItemDelete(
                                            id: state.accidents[index].id!),
                                      ),
                                      onPdfOpen: () => bloc.add(
                                        OnOpenItem(itemModelDto: state.accidents[index]),
                                      ),
                                      onDownload: () => bloc.add(
                                        OnDownloadItem(itemModelDto: state.accidents[index]),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: state.accidents.length))
                          : Expanded(
                              child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 21),
                                  itemBuilder: (context, index) {
                                    return ProfileReportItem(
                                      historyItemModelDto:
                                          state.breakdowns[index],
                                      onDelete: () => bloc.add(
                                        OnItemDelete(
                                            id: state.accidents[index].id!),
                                      ),
                                      onPdfOpen: () => bloc.add(
                                        OnOpenItem(itemModelDto: state.accidents[index]),
                                      ),
                                      onDownload: () => bloc.add(
                                        OnDownloadItem(itemModelDto: state.accidents[index]),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: state.breakdowns.length),
                            )
                    ],
                  ),
                ),
        );
      },
    );
  }
}

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/damaged_media_event.dart';
import 'bloc/damaged_media_bloc.dart';
import 'widgets/empty_state.dart';
import 'widgets/button.dart';
import 'widgets/item.dart';

class DamagedMediaScreen extends StatefulWidget {
  //
  static const String route = '/damaged_media_screen';

  const DamagedMediaScreen({super.key});

  @override
  State<DamagedMediaScreen> createState() => _DamagedMediaScreenState();
}

class _DamagedMediaScreenState extends State<DamagedMediaScreen> {
  //
  late DamagedMediaBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = DamagedMediaBloc(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      mediaService: getIt<MediaServiceImpl>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<DamagedMediaBloc, DamagedMediaState>(
        builder: (context, state) {
          final list = state.files;

          return Scaffold(
            extendBody: true,
            body: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  StepIndicator(
                    currentStep: 2,
                    title: 'strAccident'.tr(),
                  ),
                  const SizedBox(height: 20),
                  if (list.isEmpty)
                    const Expanded(
                      flex: 2,
                      child: DamagedMediaEmptyStateWidget(),
                    )
                  else
                    Expanded(
                      flex: 7,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (_, index) {
                          final file = list[index];

                          return DamagedMediaItem(
                            file: file,
                            onRemove: (file) => bloc.add(
                              OnRemoveDamagedMediaFile(file),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 126 / 170,
                        ),
                      ),
                    ),
                  if (state.files.length < 8)
                    DamagedMediaButton(
                      onTap: () => bloc.add(OnAddDamagedMediaFiles()),
                    ),
                  const Expanded(flex: 1, child: SizedBox(height: 20)),
                ],
              ),
            ),
            floatingActionButton: NavigationButton(
              onNextTap: () => bloc.add(OnUploadDamagedMediaFiles()),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}

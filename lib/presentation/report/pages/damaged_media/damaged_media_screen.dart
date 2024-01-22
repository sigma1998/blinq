// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'cubit/damaged_media_cubit.dart';
import 'widgets/button.dart';
import 'widgets/item.dart';
import 'widgets/states/empty_state.dart';
import 'widgets/states/loading_state.dart';

class DamagedMediaScreen extends StatefulWidget {
  //
  static const String route = '/damaged_media_screen';

  const DamagedMediaScreen({super.key});

  @override
  State<DamagedMediaScreen> createState() => _DamagedMediaScreenState();
}

class _DamagedMediaScreenState extends State<DamagedMediaScreen> {
  //
  late DamagedMediaCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = DamagedMediaCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      mediaService: getIt<MediaServiceImpl>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocBuilder<DamagedMediaCubit, DamagedMediaState>(
        builder: (context, state) {
          final isLoading = state.status == Status.loading;
          final isUploading = state.isUploading;
          final list = state.files;

          if (isLoading && !isUploading) return const Loading();

          return Stack(
            children: [
              SafeArea(
                child: Scaffold(
                  extendBody: true,
                  body: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        StepIndicator(
                          currentStep: cubit.step(),
                          showTrailingTitle: true,
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
                                  fileSize: state.fileSize[file] ?? '',
                                  onRemove: cubit.removeDamagedMediaPressed,
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
                            onTap: cubit.imagePickerPressed,
                          ),
                        const Expanded(flex: 1, child: SizedBox(height: 20)),
                      ],
                    ),
                  ),
                  floatingActionButton: NavigationButton(
                    onNextTap: cubit.onUploadDamagedMediaFiles,
                    label: state.files.isEmpty ? 'strNo'.tr() : 'strNext'.tr(),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                ),
              ),
              isUploading
                  ? const DamagedMediaLoadingStateWidget()
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/report/pages/damaged_media/widgets/photo_item.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/bloc/report_bloc/report_type.dart';
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
                  appBar: ProgressAppBar(
                    step: 11,
                    onSaveTap: cubit.onUploadDamagedMediaFiles,
                  ),
                  extendBody: true,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              const DamagedMediaEmptyStateWidget(),
                              const SizedBox(height: 32),
                              if (list.isNotEmpty)
                                GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: list.length + 1,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    if (index == list.length) {
                                      return PhotoItem(
                                        onTap: cubit.imagePickerPressed,
                                      );
                                    } else {
                                      final file = list[index];
                                      return DamagedMediaItem(
                                        file: file,
                                        onRemove:
                                            cubit.removeDamagedMediaPressed,
                                      );
                                    }
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 172 / 200,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (state.files.isEmpty)
                          Padding(
                            padding: EdgeInsets.only(bottom: 160.0.h),
                            child: DamagedMediaButton(
                              onTap: cubit.imagePickerPressed,
                            ),
                          ),
                        const SizedBox(height: 10),
                        NavigationButton(
                          padding: 0,
                          onNextTap: cubit.onUploadDamagedMediaFiles,
                          label: state.files.isEmpty
                              ? 'strNo'.tr()
                              : 'strNext'.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              isUploading
                  ? Container(
                      color: AppColors.grey2.withOpacity(0.4),
                      child: const DamagedMediaLoadingStateWidget(),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

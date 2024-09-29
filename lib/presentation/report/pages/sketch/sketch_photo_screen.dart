import 'dart:io';

import 'package:blinq/presentation/report/pages/sketch/widget/sketch_button.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/locator.dart';
import '../../../../core/drawables/app_drawables.dart';
import '../../../../domain/bloc/report_bloc/report_bloc.dart';
import '../../../../domain/repositories/accident_repository.dart';
import '../../../../domain/repositories/breakdown_repository.dart';
import '../../../../utils/components/app_bar/progress_app_bar.dart';
import '../../../../utils/custom_widgets/buttons/navigation_button.dart';
import '../../../../utils/generic_bloc_state.dart';
import '../../../../utils/navigation_service.dart';
import '../../../../utils/services/media/media_service.dart';
import '../damaged_media/widgets/button.dart';
import 'bloc/sketch_bloc.dart';

class SketchPhotoScreen extends StatefulWidget {
  static const String route = '/sketch_photo_screen';

  const SketchPhotoScreen({super.key});

  @override
  State<SketchPhotoScreen> createState() => _SketchPhotoScreenState();
}

class _SketchPhotoScreenState extends State<SketchPhotoScreen> {
  late SketchBloc bloc;
  bool loading = false;
  File? file;

  @override
  void didChangeDependencies() {
    bloc = SketchBloc(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
      mediaService: getIt<MediaServiceImpl>(),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() async {
    super.dispose();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchBloc, GenericBlocState<bool>>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: ProgressAppBar(
            step: 7,
            onSaveTap: () => bloc.onSubmitted(context),
            onBackTap: () => NavigationService.back(),
          ),
          body: Column(
            children: [
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SketchButton(
                  text: '7. Picture of  breakdown',
                  iconPath: AppDrawables.sketch,
                  onPressed: () {
                    NavigationService.back();
                  },
                ),
              ),
              Expanded(
                child: file != null
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.file(file!),
                          if(loading)
                          const Loading()
                        ],
                      )
                    : DamagedMediaButton(
                        onTap: () async {
                          final res = await bloc.getImageFromGallery();
                          setState(() {
                            file = res;
                          });
                        },
                      ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              bottom: 16,
            ),
            child: NavigationButton(
              padding: 0,
              loading: state.status == Status.loading,
              onNextTap: () async {
                setState(() {
                  loading = true;
                });
                if (file != null) {
                  await bloc.uploadSketch(file!);
                }
                await bloc.onSubmitted(context);
                setState(() {
                  loading = false;
                });
              },
              onBack: () => NavigationService.back(),
            ),
          ),
        );
      },
    );
  }
}

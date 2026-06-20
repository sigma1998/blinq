// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_bloc.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_state.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/modal_progress_hud.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/components/app_bar/progress_app_bar.dart';
import '../../../../utils/date_formatter.dart';
import '../../../../utils/navigation_service.dart';
import '../../../../utils/services/location/location_service.dart';
import '../../../home/home_screen.dart';

class LocationInfoScreen extends StatefulWidget {
  //
  static const route = '/location_info';

  const LocationInfoScreen({super.key});

  @override
  State<LocationInfoScreen> createState() => _LocationInfoScreenState();
}

class _LocationInfoScreenState extends State<LocationInfoScreen> {
  late final LocationInfoScreenCubit cubit;
  final TextEditingController placeController = TextEditingController();
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  String? country;

  @override
  void dispose() {
    placeController.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    cubit = LocationInfoScreenCubit(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read(),
    );
    cubit.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationInfoScreenCubit, LocationInfoScreenState>(
      bloc: cubit,
      builder: (context, state) {
        return KeyboardEscape(
          child: ModalProgressHud(
            isLoading: state.status == Status.loading,
            child: ScreenBackground(
              body: Stack(
                children: [
                  Column(
                    children: [
                      ProgressAppBar(step: 1),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: MediaQuery.of(context).viewInsets.bottom + 24,
                          ),
                          physics: const ClampingScrollPhysics(),
                          children: [
                            const Text(
                              '1. Time and place of breakdown',
                              style: AppTextStyles.s22W600,
                            ),
                            const SizedBox(height: 32),
                            getButton(
                              iconPath: AppDrawables.calendar,
                              title: DateFormat('dd.MM.yyyy').format(date),
                              defaultTitle: 'Date',
                              onTap: () async {
                                final newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  lastDate: DateTime(DateTime.now().year + 100),
                                  firstDate: DateTime(DateTime.now().year - 100),
                                );
                                if (newDate != null) {
                                  setState(() {
                                    date = newDate;
                                  });
                                }
                              },
                            ),
                            getButton(
                              iconPath: AppDrawables.time,
                              title: DateFormat('HH:mm').format(time),
                              defaultTitle: 'Time',
                              onTap: () async {
                                final newDate = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: time.hour, minute: time.minute),
                                );
                                if (newDate != null) {
                                  time = DateTime(
                                    2024,
                                    1,
                                    1,
                                    newDate.hour,
                                    newDate.minute,
                                  );
                                }
                              },
                            ),
                            getButton(
                              iconPath: AppDrawables.globe,
                              title: country,
                              defaultTitle: 'Country',
                              onTap: () async {
                                country = await cubit.onCountryPressed();
                                setState(() {});
                              },
                            ),
                            // getButton(
                            //   iconPath: AppDrawables.globe,
                            //   title: place,
                            //   defaultTitle: 'Place',
                            //   showArrow: false,
                            //   onTap: () {},
                            // ),

                            getPlaceBtn(),

                            // const SizedBox(height: 200),
                            // RoundedDatePickerTextField(
                            //   maxDate: DateTime.now(),
                            //   initialDate: DateTime.now(),
                            //   controller: cubit.dateController,
                            // ),
                            // const SizedBox(height: 36),
                            // Text(
                            //   'strTimeOfAccident'.tr(),
                            //   style: const TextStyle(
                            //     fontSize: 26,
                            //     fontWeight: FontWeight.w700,
                            //   ),
                            // ),
                            // const SizedBox(height: 12),
                            // RoundedTimePickerTextField(
                            //   initialTime: TimeOfDay.now(),
                            //   controller: cubit.timeController,
                            // ),
                            // const SizedBox(height: 36),
                            // PickerTextField(
                            //   onTap: cubit.onCountryPressed,
                            //   labelText: 'strCountry'.tr(),
                            //   controller: cubit.countryController,
                            // ),
                            // const SizedBox(height: 36),
                            // NameTextField(
                            //   labelText: 'strPlace'.tr(),
                            //   maxLines: 3,
                            //   controller: cubit.placeController,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 16,
                    right: 0,
                    left: 0,
                    child: opened
                        ? const SizedBox()
                        : NavigationButton(padding: 16, onNextTap: placeController.text.isNotEmpty && country != null ? onSubmit : null),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  onSubmit() {
    cubit.onSubmit(
      date: DateFormatter.fyyyyMMdd(date),
      time: DateFormatter.fhhmm(time),
      place: placeController.text,
      country: country!,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getLocationData();
    });
    super.initState();
  }

  getLocationData() {
    final lat = LocationService.myPosition!.latitude;
    final long = LocationService.myPosition!.longitude;

    getCountry(lat: lat, long: long);
    getPlace(lat: lat, long: long);
  }

  getCountry({required double lat, required long}) async {
    country = await LocationService.getCountry(lat, long);
    setState(() {});
  }

  Future<void> getPlace({required double lat, required long}) async {
    final res = await LocationService.getAddressFromLatLng(lat, long);
    setState(() {
      placeController.text = res ?? '';
    });
  }

  final focus = FocusNode();
  bool opened = false;

  getPlaceBtn() {
    return GlassContainer(
      radius: 12,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          SvgPicture.asset(AppDrawables.globe),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: placeController,
              maxLines: 3,
              style: AppTextStyles.s17W400,
              focusNode: focus
                ..addListener(() {
                  setState(() {
                    opened = focus.hasFocus;
                  });
                }),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Place',
                hintStyle: AppTextStyles.s17W400.copyWith(
                  color: AppColors.grey1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getButton({
    required String iconPath,
    required String? title,
    required String? defaultTitle,
    bool showArrow = true,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: GlassContainer(
          padding: const EdgeInsets.symmetric(vertical: 12),
          radius: 12,
          child: Row(
            children: <Widget>[
              const SizedBox(width: 16),
              SvgPicture.asset(iconPath),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title ?? defaultTitle ?? '',
                  style: AppTextStyles.s17W400.copyWith(
                    color: title == null ? AppColors.grey1 : AppColors.white,
                  ),
                ),
              ),
              showArrow
                  ? const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  : SizedBox(),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}

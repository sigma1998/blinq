// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/data/model/accident/accident_time_and_location/accident_time_and_location.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_state.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/presentation/report/pages/injury/injury_screen.dart';
import 'package:blinq/utils/services/location/location_service.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';

class LocationInfoScreenCubit extends Cubit<LocationInfoScreenState> {
  //
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  LocationInfoScreenCubit({
    required this.accidentRepository,
    required this.reportBloc,
  }) : super(const LocationInfoScreenState());

  void init() async {
    emit(state.copyWith(status: Status.loading));
    await LocationService.getAddressFromLatLng(
      LocationService.myPosition!.latitude,
      LocationService.myPosition!.longitude,
    ).then((value) {
      placeController.text = value ?? '';
      countryController.text = value!.split(',').last;
    });
    emit(state.copyWith(status: Status.initial));
  }

  void onCountryPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryController.text = value;
      }
    });
  }

  Future<void> onSubmit() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await accidentRepository.adAccidentLocationAndTime(
        reportBloc.reportId,
        AccidentTimeAndLocationDto(
            country: countryController.text,
            location: placeController.text,
            createdAt: dateController.text),
      );
      emit(state.copyWith(status: Status.initial));
      reportBloc.setProgress(reportBloc.progress + 1);
      NavigationService.pushNamed(
          routeName: InjuryScreen.route,
          nestedKey: NavigationService.homeNavigatorKey);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}

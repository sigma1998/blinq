// Flutter imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/injury/injury_screen.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_state.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';

class LocationInfoScreenCubit extends Cubit<LocationInfoScreenState> {
  //
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;
  final ReportBloc reportBloc;

  LocationInfoScreenCubit({
    required this.accidentRepository,
    required this.breakdownRepository,
    required this.reportBloc,
  }) : super(const LocationInfoScreenState());

  void init() async {
    emit(state.copyWith(status: Status.initial));
  }

  Future<String?> onCountryPressed() async {
    final res =
        await NavigationService.showDialog(dialog: const CountriesDialog());
    return res;
  }

  Future<void> onSubmit({
    required String date,
    required String time,
    required String place,
    required String country,
  }) async {
    emit(state.copyWith(status: Status.loading));
    try {
      if (reportBloc.reportType == ReportType.accident) {
        await accidentRepository.addAccidentLocationAndTime(
          reportBloc.reportId,
          ReportTimeAndLocationDto(
              country: country,
              location: place,
              createdAt: '${date}T$time:00Z'),
        );
      } else {
        await breakdownRepository.addBreakdownLocationAndTime(
          reportBloc.reportId,
          ReportTimeAndLocationDto(
              country: country,
              location: place,
              createdAt: '${date}T$time:00Z'),
        );
      }

      emit(state.copyWith(status: Status.initial));
      NavigationService.pushNamed(
          routeName: InjuryScreen.route,
          nestedKey: NavigationService.homeNavigatorKey);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}

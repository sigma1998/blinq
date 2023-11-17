// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'countries_event.dart';

part 'countries_state.dart';
part 'countries_bloc.freezed.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  //
  CountriesBloc() : super(const CountriesState(status: Status.loading)) {
    on<OnLoadCountries>(_onLoadCountries);
  }

  FutureOr<void> _onLoadCountries(
      OnLoadCountries event, Emitter<CountriesState> emit) async {
    try {
      final countries =
          PhoneCodes.getAllCountryDatas().map((e) => e.country ?? '').toList();
      countries.sort();
      emit(CountriesState(countries: countries, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}

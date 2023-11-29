import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationInfoScreenBloc extends Cubit<LocationInfoScreenState> {
  final AccidentRepository accidentRepository;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  LocationInfoScreenBloc({required this.accidentRepository})
      : super(const LocationInfoScreenState());



}

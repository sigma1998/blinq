// Package imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/data/model/second_driver/car/request/second_driver_car_request_model.dart';
import 'package:blinq/utils/custom_widgets/dialogs/default_dialog.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/data/model/vehicle_info/brand/vehicle_info_dto.dart';
import 'package:blinq/data/model/vehicle_info/color/vehicle_color_dto.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

part 'second_driver_car_state.dart';
part 'second_driver_car_cubit.freezed.dart';

class SecondDriverCarCubit extends Cubit<SecondDriverCarState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;
  final ProfileRepository profileRepository;

  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final colorController = TextEditingController();
  final modelSeriesController = TextEditingController();

  final makeTypeController = TextEditingController();
  final engineNumberController = TextEditingController();
  final countryOfRegistrationController = TextEditingController();
  final trailerRegistrationNumberController = TextEditingController();
  final trailerCountryOfRegistrationController = TextEditingController();

  List<VehicleInfoDto> brands = [];
  List<VehicleInfoDto> models = [];
  List<VehicleColorDto> colors = [];

  VehicleInfoDto? selectedBrand;
  VehicleInfoDto? selectedModel;
  VehicleColorDto? selectedColor;

  SecondDriverCarCubit({
    required this.reportBloc,
    //
    required this.accidentRepository,
    required this.profileRepository,
  }) : super(const SecondDriverCarState());

  Future<void> init() async {
    await _fetchBrands();
  }

  void onSubmit() async {
    emit(state.copyWith(status: Status.loading));

    try {
      final carB = SecondDriverCarRequestModel(
        //~ Car
        mark: brandController.text,
        car: selectedModel?.id,
        modelSeries: modelSeriesController.text,
        color: selectedColor?.id,

        //& Motor

        makeType: makeTypeController.text,
        engineNumber: engineNumberController.text,
        countryOfRegistration: countryOfRegistrationController.text,
        trailerRegistrationNumber: trailerRegistrationNumberController.text,
        trailerCountryOfRegistration:
            trailerCountryOfRegistrationController.text,
      );

      await accidentRepository.updateCarB(
        reportBloc.accidentId,
        carB,
      );

      NavigationService.back();
    } catch (e) {
      debugPrint(e.toString());
      NavigationService.showErrorToast('strTryAgain');
    }
  }

  //

  void onBrandTap() async {
    final res = await NavigationService.showDialog(
      dialog: MyDialog(
        items: List.generate(
          brands.length,
          (index) => brands[index].name!,
        ),
      ),
    );
    if (res != null) {
      emit(state.copyWith(status: Status.loading));
      brandController.text = res;
      for (var element in brands) {
        if (element.name == res) {
          selectedBrand = element;
        }
      }
      models = [];
      await _fetchModels(brandId: selectedBrand!.id!);
      await _fetchColors(brandId: selectedBrand!.id!);

      emit(state.copyWith(status: Status.initial));
    }
  }

  void onModelTap() async {
    final res = await NavigationService.showDialog(
        dialog: MyDialog(
            items:
                List.generate(models.length, (index) => models[index].name!)));
    if (res != null) {
      modelController.text = res;
      for (var element in models) {
        if (element.name == res) {
          selectedModel = element;
        }
      }
    }
  }

  void onColorTap() async {
    final res = await NavigationService.showDialog(
      dialog: MyDialog(
        items: List.generate(
          colors.length,
          (index) => colors[index].colour ?? 'whaat?',
        ),
      ),
    );
    if (res != null) {
      colorController.text = res;
      for (var element in colors) {
        if (element.colour == res) {
          selectedColor = element;
        }
      }
    }
  }

  //

  void onSelectCountryOfRegistrationPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryOfRegistrationController.text = value;
      }
    });
  }

  void onSelectTrailerCountryOfRegistrationPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        trailerCountryOfRegistrationController.text = value;
      }
    });
  }

  //

  Future<void> _fetchBrands({int page = 1}) async {
    try {
      final res = await profileRepository.fetchBrands(page);
      brands.addAll(res.results ?? []);
      if (res.next != null) {
        await _fetchBrands(page: page + 1);
      }

      emit(state.copyWith(status: Status.initial));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _fetchModels({int page = 1, required int brandId}) async {
    try {
      final res = await profileRepository.fetchModels(page, brandId);
      models.addAll(res.results ?? []);
      if (res.next != null) {
        await _fetchModels(page: page + 1, brandId: brandId);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _fetchColors({int page = 1, required int brandId}) async {
    try {
      final res = await profileRepository.fetchColors(page, brandId);
      colors.addAll(res.results ?? []);
      if (res.next != null) {
        await _fetchColors(page: page + 1, brandId: brandId);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

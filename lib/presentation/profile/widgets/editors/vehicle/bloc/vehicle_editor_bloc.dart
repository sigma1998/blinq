// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:blinq/presentation/profile/widgets/editors/my_car/widget/my_vehicle_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import '../../../../../../data/model/vehicle_info/brand/vehicle_info_dto.dart';
import '../../../../../../data/model/vehicle_info/color/vehicle_color_dto.dart';
import '../../../../../../utils/custom_widgets/dialogs/default_dialog.dart';
import 'vehicle_editor_event.dart';

part 'vehicle_editor_bloc.freezed.dart';

part 'vehicle_editor_state.dart';

class VehicleEditorBloc extends Bloc<VehicleEditorEvent, VehicleEditorState> {
  //
  final ProfileBloc profileBloc;

  final ProfileRepository repository;

  final formKey = GlobalKey<FormState>();

  final markController = TextEditingController();
  final modelController = TextEditingController();
  final modelSeriesController = TextEditingController();
  final colorController = TextEditingController();

  //final vehicleTypeController = TextEditingController();
  final makeTypeController = TextEditingController();
  final plateNumberController = TextEditingController();
  final engineNumberController = TextEditingController();
  final countryOfRegistrationController = TextEditingController();

  List<VehicleInfoDto> brands = [];
  Map<int, List<VehicleInfoDto>> models = {};
  Map<int, List<VehicleColorDto>> colors = {};

  VehicleInfoDto? selectedBrand;
  VehicleInfoDto? selectedModel;
  VehicleColorDto? selectedColor;

  VehicleEditorBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(const VehicleEditorState()) {
    on<OnSubmitVehicle>(_onSubmitVehicle);

    on<Initial>((event, emit) async {
      try {
        final res = await repository.fetchBrands(event.next ?? 1);
        brands.addAll(res.results ?? []);
        if (res.next != null) {
          add(Initial(next: (event.next ?? 1) + 1));
        }

        if (markController.text.isNotEmpty) {
          for (var element in res.results ?? []) {
            if (element.name == markController.text) {
              selectedBrand = element;
              add(GetModels(element.id ?? 0));
              add(GetColors(element.id ?? 0));
            }
          }
        }
        emit(state.copyWith(status: Status.initial));
      } catch (e) {
        debugPrint(e.toString());
      }
    });

    on<GetModels>((event, emit) async {
      _fetchModels(brandId: event.brandId, emit: emit);
    });

    on<GetColors>((event, emit) async {
      _fetchColors(brandId: event.brandId, emit: emit);
    });

    add(Initial());
    initializeFields();
  }

  void initializeFields() {
    makeTypeController.text = profileBloc.state.profile?.car?.makeType ?? '';
    engineNumberController.text =
        profileBloc.state.profile?.car?.engineNumber ?? '';
    countryOfRegistrationController.text =
        profileBloc.state.profile?.car?.countryOfRegistration ?? '';
    modelSeriesController.text = profileBloc.state.profile?.car?.modelSeries
            ?.replaceAll('[\'', '')
            .replaceAll('\']', '') ??
        '';
    // vehicleTypeController.text =
    //     profileBloc.state.profile?.car?.vehicleType ?? '';
    colorController.text = profileBloc.state.profile?.car?.color ?? '';
    markController.text = profileBloc.state.profile?.car?.brand ?? '';
    plateNumberController.text =
        profileBloc.state.profile?.car?.plateNumber ?? '';
    modelController.text = profileBloc.state.profile?.car?.car ?? '';
  }

  bool validateForm() => formKey.currentState!.validate();

  void onSelectCountryOfRegistrationPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryOfRegistrationController.text = value;
      }
    });
  }

  // void onVehicleTypePressed() {
  //   NavigationService.showDialog(dialog: const VehicleTypeDialog())!
  //       .then((type) {
  //     if (type != null) {
  //       vehicleTypeController.text = type ?? '';
  //     }
  //   });
  // }

  void onVehicleMarkPressed() {
    NavigationService.showDialog(dialog: MyVehicleDialog(brands: brands))!
        .then((type) {
      if (type != null) {
        markController.text = type ?? '';
        for (var element in brands) {
          if (element.name == type) {
            selectedColor = null;
            selectedModel = null;
            colorController.clear();
            modelController.clear();
            selectedBrand = element;
            add(GetModels(element.id ?? 0));
            add(GetColors(element.id ?? 0));
          }
        }
      }
    });
  }

  void onColorTap() async {
    final res = await NavigationService.showDialog(
      dialog: MyDialog(
        items: List.generate(
          colors[selectedBrand?.id]?.length ?? 0,
          (index) => colors[selectedBrand?.id]?[index].colour ?? 'whaat?',
        ),
      ),
    );

    if (res != null) {
      colorController.text = res;
      for (var element in colors[selectedBrand?.id] ?? []) {
        if (element.colour == res) {
          selectedColor = element;
        }
      }
    }
  }


  void onModelTap() async {
    final res = await NavigationService.showDialog(
      dialog: MyDialog(
        items: List.generate(
          models[selectedBrand?.id]?.length ?? 0,
          (index) => models[selectedBrand?.id]?[index].name ?? 'whaat?',
        ),
      ),
    );

    if (res != null) {
      modelController.text = res;
      for (var element in (models[selectedBrand?.id] ?? [])) {
        if (element.name == res) {
          selectedModel = element;
        }
      }
    }
  }

  //

  FutureOr<void> _onSubmitVehicle(
      OnSubmitVehicle event, Emitter<VehicleEditorState> emit) async {
    final vehicle = CarRequestModel(
      carId: selectedModel?.id,
      colorId: selectedColor?.id,
      modelSeries: modelSeriesController.text.split(', '),
      makeType: makeTypeController.text,
      engineNumber: engineNumberController.text,
      countryOfRegistration: countryOfRegistrationController.text,
      //vehicleType: vehicleTypeController.text,
      customBrand: selectedBrand?.name,
      customCarColour: selectedColor?.colour,
      plateNumber: plateNumberController.text,
      car: selectedModel?.id,
      color: selectedColor?.id,
      
    );

    emit(const VehicleEditorState(status: Status.loading));
    await repository.updateCar(vehicle);
    emit(const VehicleEditorState(status: Status.success));
    profileBloc.add(OnFetchProfile());
    NavigationService.back(result: true);
  }

  // getType() {
  //   for (var element in VehicleType.values) {
  //     if (element.title.toLowerCase() == vehicleTypeController.text) {
  //       return element;
  //     }
  //   }
  //   return VehicleType.auto;
  // }

  Future<void> _fetchModels(
      {int page = 1,
      required int brandId,
      required void Function(VehicleEditorState state) emit}) async {
    try {
      if (page == 1) {
        models.clear();
      }
      final res = await repository.fetchModels(page, brandId);
      if (models.containsKey(brandId)) {
        List<VehicleInfoDto> newList = [
          ...models[brandId] ?? [],
          ...res.results ?? []
        ];
        models[brandId] = newList;
      } else {
        models[brandId] = res.results ?? [];
      }
      if (res.next != null) {
        int nextPage = page + 1;
        await _fetchModels(page: nextPage, brandId: brandId, emit: emit);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _fetchColors(
      {int page = 1,
      required int brandId,
      required void Function(VehicleEditorState state) emit}) async {
    try {
     if (page == 1) {
        colors.clear();
      }
      final res = await repository.fetchColors(page, brandId);
      if (colors.containsKey(brandId)) {
        List<VehicleColorDto> newList = [
          ...colors[brandId] ?? [],
          ...res.results ?? []
        ];
        colors[brandId] = newList;
      } else {
        colors[brandId] = res.results ?? [];
      }
      if (res.next != null) {
        int nextPage = page + 1;
        await _fetchColors(page: nextPage, brandId: brandId, emit: emit);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

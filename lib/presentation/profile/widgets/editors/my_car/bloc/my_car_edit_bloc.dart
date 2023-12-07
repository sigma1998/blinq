import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/data/model/vehicle_info/brand/vehicle_info_dto.dart';
import 'package:blinq/data/model/vehicle_info/color/vehicle_color_dto.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/bloc/edit_my_car_state.dart';
import 'package:blinq/utils/custom_widgets/dialogs/default_dialog.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/vehicle_type_dialog/vehicle_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMyCarBloc extends Cubit<EditMyCarState> {
  final ProfileRepository profileRepository;
  final ProfileBloc profileBloc;

  final formKey = GlobalKey<FormState>();

  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController modelSeriesController = TextEditingController();

  List<VehicleInfoDto> brands = [];
  List<VehicleInfoDto> models = [];
  List<VehicleColorDto> colors = [];

  VehicleInfoDto? selectedBrand;
  VehicleInfoDto? selectedModel;
  VehicleColorDto? selectedColor;

  EditMyCarBloc({required this.profileRepository, required this.profileBloc})
      : super(const EditMyCarState(status: Status.loading)) {
    vehicleTypeController.text =
        profileBloc.state.profile?.car?.vehicleType?.name ?? '';
    brandController.text = profileBloc.state.profile?.car?.brand ?? '';
    modelController.text = profileBloc.state.profile?.car?.car ?? '';
    colorController.text = profileBloc.state.profile?.car?.color ?? '';
    modelSeriesController.text =
        profileBloc.state.profile?.car?.modelSeries ?? '';

    if (profileBloc.state.profile?.car?.brandId != null) {
      selectedBrand = VehicleInfoDto(
          id: profileBloc.state.profile?.car?.brandId,
          name: profileBloc.state.profile?.car?.brand);
    }
    if (profileBloc.state.profile?.car?.carId != null) {
      selectedModel = VehicleInfoDto(
          id: profileBloc.state.profile?.car?.carId,
          name: profileBloc.state.profile?.car?.car);
    }
    if (profileBloc.state.profile?.car?.colorId != null) {
      selectedColor = VehicleColorDto(
          id: profileBloc.state.profile?.car?.colorId,
          colour: profileBloc.state.profile?.car?.color);
    }
  }

  Future<void> init() async {
    await _fetchBrands();
  }

  bool validateForm() => formKey.currentState!.validate();

  void onVehicleTypeTap() async {
    NavigationService.showDialog(dialog: const VehicleTypeDialog())!
        .then((type) {
      if (type != null) {
        vehicleTypeController.text = type ?? '';
      }
    });
  }

  void onBrandTap() async {
    final res = await NavigationService.showDialog(
        dialog: MyDialog(
            items:
                List.generate(brands.length, (index) => brands[index].name!)));
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
                colors.length, (index) => colors[index].colour ?? 'whaat?')));
    if (res != null) {
      colorController.text = res;
      for (var element in colors) {
        if (element.colour == res) {
          selectedColor = element;
        }
      }
    }
  }

  void onSubmit() async {
    emit(state.copyWith(status: Status.loading));

    try {
      await profileRepository.updateMyCar(
        CarRequestModel(
          vehicleType: VehicleType.values
              .firstWhere((type) => type.name == vehicleTypeController.text),
          brandId: selectedBrand?.id,
          brand: selectedBrand?.name,
          carId: selectedModel?.id,
          car: selectedModel?.name,
          modelSeries: modelController.text,
          color: selectedColor?.colour,
          colorId: selectedColor?.id,
        ),
      );

      profileBloc.add(OnFetchProfile());

      NavigationService.back();
    } catch (e) {
      debugPrint(e.toString());
      NavigationService.showErrorToast('strTryAgain');
    }
  }

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

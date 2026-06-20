// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';

// Project imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/data/model/cheack_account_datas/cheack_account_datas_response.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/my_reports/reports_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/driver/driver_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/insurance/insurance_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/my_car_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_vehicle/my_vehicle_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/policy_holder/policy_holder_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/vehicle/vehicle_editor_screen.dart';
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/qr_dialog/qr_dialog.dart';
import 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //
  final ProfileRepository repository;
  final AuthRepository authRepository;
  final MediaService mediaService;

  VehicleType? vehicleType;

  ProfileResponseModel? profile;

  CheckAccountResponse? checkAccountResponse;

  ProfileBloc({
    required this.authRepository,
    required this.repository,
    required this.mediaService,
  }) : super(const ProfileState()) {
    on<OnFetchProfile>(_onFetchProfile);
    on<OnUpdateProfileImage>(_onUpdateProfileImage);
  }

  FutureOr<void> _onFetchProfile(OnFetchProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState(status: Status.loading));
      final data = await repository.fetch();
      for (var element in VehicleType.values) {
        if (data.car?.vehicleType == element.name) {
          vehicleType = element;
        }
      }
      profile = data;
      authRepository.setUserId(data.id);
      checkAccountResponse = await repository.checkAccountData();
      emit(ProfileState(profile: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> onUpdateProfile(ProfileRequestModel profile) async {
    try {
      await repository.update(profile);
      add(OnFetchProfile());
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onUpdateProfileImage(OnUpdateProfileImage event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.updateProfileImage(event.file);
      emit(state.copyWith(status: Status.success));
      add(OnFetchProfile());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> imagePickerPressed() async {
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        GestureDetector(
          onTap: () async {
            final imagePath = await mediaService.pickImagePath(AppImageSource.camera);
            final result = await ImageCropHelper.cropImage(
              imagePath,
              cropStyle: CropStyle.circle,
            );
            NavigationService.back(result: result);
          },
          child: Container(
            alignment: Alignment.center,
            height: 56,
            color: AppColors.white.withAlpha(180),
            child: Material(
              color: Colors.transparent,
              child: Text(
                'strTakeImage'.tr(),
                style: AppTextStyles.s17W400.copyWith(color: AppColors.blue),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final imagePath = await mediaService.pickImagePath(AppImageSource.gallery);
            final result = await ImageCropHelper.cropImage(
              imagePath,
              cropStyle: CropStyle.circle,
            );
            NavigationService.back(result: result);
          },
          child: Container(
            alignment: Alignment.center,
            height: 56,
            color: AppColors.white.withAlpha(180),
            child: Material(
              color: Colors.transparent,
              child: Text(
                'strSelectPhoto'.tr(),
                style: AppTextStyles.s17W400.copyWith(color: AppColors.blue),
              ),
            ),
          ),
        ),
      ],
    );
    if (result != null) {
      add(OnUpdateProfileImage(file: result));
    }
  }

  //* My Information

  void onDriverPressed() => NavigationService.pushNamed(routeName: DriverEditorScreen.route);

  void onPolicyHolderPressed() => NavigationService.pushNamed(routeName: PolicyHolderEditorScreen.route);

  void onVehiclePressed() => NavigationService.pushNamed(routeName: VehicleEditorScreen.route);

  void onInsurancePressed() => NavigationService.pushNamed(routeName: InsuranceEditorScreen.route);

  void onMyCarPressed() => NavigationService.pushNamed(routeName: EditorMyCarScreen.route);

  void onQrCodePressed() => NavigationService.showDialog(
        dialog: const QrDialog(),
        barrierColor: Colors.transparent,
      );

  //& My Vehicle

  void onMyVehiclePressed() => NavigationService.pushNamed(routeName: MyVehicleEditorScreen.route);

  void onReportsPressed() => NavigationService.pushNamed(routeName: ReportsScreen.route);
}

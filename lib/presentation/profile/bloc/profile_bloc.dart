// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:blinq/presentation/dialogs/qr_dialog/qr_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/widgets/editors/driver/driver_editor_screen.dart';
import 'package:blinq/presentation/order_history/order_history_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/insurance/insurance_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/my_car_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_vehicle/my_vehicle_editor_screen.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/utils/services/media/i_media_service.dart';
import 'package:blinq/presentation/profile/widgets/editors/policy_holder/policy_holder_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/vehicle/vehicle_editor_screen.dart';
import 'package:blinq/presentation/reports/reports_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/image_crop.dart';
import 'profile_event.dart';

part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //
  final ProfileRepository repository;
  final IMediaService mediaService;
  final ImageCrop imageCrop;

  ProfileBloc({
    required this.repository,
    required this.mediaService,
    required this.imageCrop,
  }) : super(const ProfileState()) {
    on<OnFetchProfile>(_onFetchProfile);
    on<OnUpdateProfileImage>(_onUpdateProfileImage);
  }

  FutureOr<void> _onFetchProfile(
      OnFetchProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState(status: Status.loading));
      final data = await repository.fetch();
      repository.setProfile(data);
      emit(ProfileState(profile: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> onUpdateProfile(ProfileRequestModel profile) async {
    try {
      final data = await repository.update(profile);
      repository.setProfile(data);
      add(OnFetchProfile());
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onUpdateProfileImage(
      OnUpdateProfileImage event, Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState(status: Status.loading));
      await repository.updateProfileImage(event.file);
      emit(const ProfileState(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> imagePickerPressed() async {
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        MyCupertinoActionSheetAction(
          label: 'strTakeImage'.tr(),
          onPressed: () async {
            final imagePath =
                await mediaService.pickImagePath(AppImageSource.camera);
            final result = await imageCrop.cropImage(imagePath);
            NavigationService.back(result: result);
          },
        ),
        MyCupertinoActionSheetAction(
          label: 'strSelectPhoto'.tr(),
          onPressed: () async {
            final imagePath =
                await mediaService.pickImagePath(AppImageSource.gallery);
            final result = await imageCrop.cropImage(imagePath);
            NavigationService.back(result: result);
          },
        ),
      ],
    );
    if (result != null) {
      add(OnUpdateProfileImage(file: result));
    }
  }

  //* My Information

  void onDriverPressed() =>
      NavigationService.pushNamed(routeName: DriverEditorScreen.route);

  void onPolicyHolderPressed() =>
      NavigationService.pushNamed(routeName: PolicyHolderEditorScreen.route);

  void onVehiclePressed() =>
      NavigationService.pushNamed(routeName: VehicleEditorScreen.route);

  void onInsurancePressed() =>
      NavigationService.pushNamed(routeName: InsuranceEditorScreen.route);

  void onMyCarPressed() =>
      NavigationService.pushNamed(routeName: MyCarEditorScreen.route);

  void onQrCodePressed() =>
      NavigationService.showDialog(dialog: const QrDialog());

  //& My Vehicle

  void onMyVehiclePressed() =>
      NavigationService.pushNamed(routeName: MyVehicleEditorScreen.route);

  void onReportsPressed() =>
      NavigationService.pushNamed(routeName: ReportsScreen.route);

  void onOrderHistoryPressed() =>
      NavigationService.pushNamed(routeName: OrderHistoryScreen.route);
}

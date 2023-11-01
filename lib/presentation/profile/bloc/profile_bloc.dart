// Dart imports:
import 'dart:async';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/data/model/profile/profile_response_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'profile_event.dart';

part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //
  final ProfileRepository _repository;

  ProfileBloc({required ProfileRepository repository})
      : _repository = repository,
        super(const ProfileState()) {
    on<OnFetchProfile>(_fetchProfile);
  }

  FutureOr<void> _fetchProfile(
      OnFetchProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState(status: Status.loading));
      final res = await _repository.fetchProfile();
      emit(ProfileState(profile: res, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
      NavigationService.showErrorToast(e.toString());
    }
  }
}

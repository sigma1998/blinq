import 'package:blinq/data/model/profile/profile_response_model.dart';

sealed class ProfileEvent {}

class OnFetch extends ProfileEvent {}

class OnUpdate extends ProfileEvent {
  ProfileResponseModel profile;

  OnUpdate({required this.profile});
}

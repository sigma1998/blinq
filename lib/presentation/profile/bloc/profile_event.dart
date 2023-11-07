// Dart imports:
import 'dart:io';

sealed class ProfileEvent {}

class OnFetchProfile extends ProfileEvent {}

class OnUpdateProfileImage extends ProfileEvent {
  File file;

  OnUpdateProfileImage({required this.file});
}

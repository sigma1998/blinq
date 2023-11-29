import 'dart:io';

sealed class DamagedMediaEvent {}

class OnAddDamagedMediaFiles extends DamagedMediaEvent {}

class OnRemoveDamagedMediaFile extends DamagedMediaEvent {
  final File file;

  OnRemoveDamagedMediaFile(this.file);
}

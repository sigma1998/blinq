sealed class EmailEditorEvent {}

class OnCurrentEmailChanged extends EmailEditorEvent {
  final String currentEmail;

  OnCurrentEmailChanged(this.currentEmail);
}

class OnNewEmailChanged extends EmailEditorEvent {
  final String newEmail;

  OnNewEmailChanged(this.newEmail);
}

class OnConfrimationCodeChanged extends EmailEditorEvent {
  final String code;

  OnConfrimationCodeChanged(this.code);
}

class OnSendCode extends EmailEditorEvent {}

class OnVerifyEmail extends EmailEditorEvent {}

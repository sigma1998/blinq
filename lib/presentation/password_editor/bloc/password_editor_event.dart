sealed class PasswordEditorEvent {}

class OnNewPasswordVisibilityChanged extends PasswordEditorEvent {}

class OnPasswordConfirmVisibilityChanged extends PasswordEditorEvent {}

class OnUpdatePassword extends PasswordEditorEvent {}

class OnOldPasswordChanged extends PasswordEditorEvent {
  final String oldPassword;

  OnOldPasswordChanged(this.oldPassword);
}

class OnNewPasswordChanged extends PasswordEditorEvent {
  final String newPassword;

  OnNewPasswordChanged(this.newPassword);
}

class OnPasswordConfirmChanged extends PasswordEditorEvent {
  final String passwordConfirm;

  OnPasswordConfirmChanged(this.passwordConfirm);
}

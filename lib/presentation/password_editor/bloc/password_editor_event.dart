sealed class PasswordEditorEvent {}

class OnNewPasswordVisibilityChanged extends PasswordEditorEvent {}

class OnPasswordConfirmVisibilityChanged extends PasswordEditorEvent {}

class OnUpdatePassword extends PasswordEditorEvent {}

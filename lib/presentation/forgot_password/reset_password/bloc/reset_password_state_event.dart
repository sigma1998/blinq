sealed class ResetPasswordScreenEvent{}

class OnFirstPasswordVisibilityChanged extends ResetPasswordScreenEvent {}

class OnSecondPasswordVisibilityChanged extends ResetPasswordScreenEvent {}

class OnSubmitted extends ResetPasswordScreenEvent {}

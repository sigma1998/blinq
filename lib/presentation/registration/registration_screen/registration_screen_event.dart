sealed class RegistrationScreenEvent {}

class OnFirstPasswordVisibilityChanged extends RegistrationScreenEvent {}

class OnSecondPasswordVisibilityChanged extends RegistrationScreenEvent {}

class OnSubmitted extends RegistrationScreenEvent {
  final String email;

  OnSubmitted({required this.email});
}

sealed class SettingsEvent {}

class ToggleNotification extends SettingsEvent {
  bool isEnabled;

  ToggleNotification({required this.isEnabled});
}

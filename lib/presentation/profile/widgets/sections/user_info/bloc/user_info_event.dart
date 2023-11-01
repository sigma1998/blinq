sealed class ProfileUserInfoEvent {}

class OnEditPressed extends ProfileUserInfoEvent {
  bool isEdit;

  OnEditPressed({required this.isEdit});
}

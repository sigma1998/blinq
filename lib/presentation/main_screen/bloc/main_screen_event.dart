sealed class MainScreenEvent {}

class OnItemPressed extends MainScreenEvent {
  int newIndex;

  OnItemPressed({required this.newIndex});
}

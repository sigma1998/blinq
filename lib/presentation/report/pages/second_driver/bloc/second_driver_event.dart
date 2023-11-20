sealed class SecondDriverEvent {}

class OnFetchSecondDriver extends SecondDriverEvent {
  final int id;

  OnFetchSecondDriver({required this.id});
}

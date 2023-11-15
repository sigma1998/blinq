sealed class PremadeMessageEditorEvent {}

class OnAddPremadeMessage extends PremadeMessageEditorEvent {}

class OnUpdatePremadeMessage extends PremadeMessageEditorEvent {
  final int id;

  OnUpdatePremadeMessage(this.id);
}

class OnDeletePremadeMessage extends PremadeMessageEditorEvent {
  final int id;

  OnDeletePremadeMessage({required this.id});
}

sealed class PreMadeMessageEditorEvent {}

class OnAddPreMadeMessage extends PreMadeMessageEditorEvent {}

class OnUpdatePreMadeMessage extends PreMadeMessageEditorEvent {
  final int id;

  OnUpdatePreMadeMessage({required this.id});
}

class OnDeletePreMadeMessage extends PreMadeMessageEditorEvent {
  final int id;

  OnDeletePreMadeMessage({required this.id});
}

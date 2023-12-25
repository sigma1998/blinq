// Flutter imports:
import 'package:flutter/foundation.dart' show immutable;

///The base state class should always be named: BlocSubject + State.

enum Status { initial, empty, loading, failure, success }

class Error {
  final Map<String, dynamic> data;
  Error({required this.data});
}

@immutable
class GenericBlocState<T> {
  final T? data;
  final Error? error;
  final Status status;

  const GenericBlocState({this.data, this.error, required this.status});

  factory GenericBlocState.initial() =>
      const GenericBlocState(status: Status.initial);

  factory GenericBlocState.empty() =>
      const GenericBlocState(status: Status.empty);

  factory GenericBlocState.loading() =>
      const GenericBlocState(status: Status.loading);

  factory GenericBlocState.failure(Error error) =>
      GenericBlocState(error: error, status: Status.failure);

  factory GenericBlocState.success(T? data) =>
      GenericBlocState(data: data, status: Status.success);
}

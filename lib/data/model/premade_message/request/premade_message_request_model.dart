// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'premade_message_request_model.freezed.dart';
part 'premade_message_request_model.g.dart';

@freezed
class PreMadeMessageRequestModel with _$PreMadeMessageRequestModel {
  //
  const factory PreMadeMessageRequestModel({
    required String? title,
    required String? message,
  }) = _PreMadeMessageRequestModel;

  factory PreMadeMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PreMadeMessageRequestModelFromJson(json);
}

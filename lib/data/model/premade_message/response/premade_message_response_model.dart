// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'premade_message_response_model.freezed.dart';
part 'premade_message_response_model.g.dart';

@freezed
class PreMadeMessageResponseModel with _$PreMadeMessageResponseModel {
  //
  const factory PreMadeMessageResponseModel({
    int? id,
    String? title,
    String? message,
  }) = _PreMadeMessageResponseModel;

  factory PreMadeMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PreMadeMessageResponseModelFromJson(json);
}

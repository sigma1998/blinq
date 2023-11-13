// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'premade_message_request_model.freezed.dart';
part 'premade_message_request_model.g.dart';

@freezed
class PremadeMessageRequestModel with _$PremadeMessageRequestModel {
  //
  const factory PremadeMessageRequestModel({
    required String? title,
    required String? message,
  }) = _PremadeMessageRequestModel;

  factory PremadeMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PremadeMessageRequestModelFromJson(json);
}

// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'premade_message_response_model.freezed.dart';
part 'premade_message_response_model.g.dart';

@freezed
@HiveType(typeId: 10)
class PremadeMessageResponseModel with _$PremadeMessageResponseModel {
  //
  const factory PremadeMessageResponseModel({
    @HiveField(0) int? id,
    @HiveField(2) String? title,
    @HiveField(3) String? message,
  }) = _PremadeMessageResponseModel;

  factory PremadeMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PremadeMessageResponseModelFromJson(json);
}

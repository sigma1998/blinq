// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'contact_response_model.freezed.dart';
part 'contact_response_model.g.dart';

@freezed
@HiveType(typeId: 8)
class ContactResponseModel with _$ContactResponseModel {
  //
  const ContactResponseModel._();

  const factory ContactResponseModel({
    @HiveField(0) int? id,
    @HiveField(1) String? image,
    @HiveField(2) @JsonKey(name: 'name') String? firstName,
    @HiveField(3) @JsonKey(name: 'last_name') String? lastName,
    @HiveField(4) @JsonKey(name: 'phone_number') String? phoneNumber,
    @HiveField(5) @JsonKey(name: 'is_emergency') bool? isEmergency,
  }) = _ContactResponseModel;

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}';

  factory ContactResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseModelFromJson(json);
}

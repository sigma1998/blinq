// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_response_model.freezed.dart';
part 'contact_response_model.g.dart';

@freezed
class ContactResponseModel with _$ContactResponseModel {
  //
  const ContactResponseModel._();

  const factory ContactResponseModel({
    int? id,
    String? image,
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'is_emergency') bool? isEmergency,
  }) = _ContactResponseModel;

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}';

  factory ContactResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseModelFromJson(json);
}

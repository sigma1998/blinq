// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_time_and_location.freezed.dart';
part 'report_time_and_location.g.dart';

@freezed
class ReportTimeAndLocationDto with _$ReportTimeAndLocationDto {
  const factory ReportTimeAndLocationDto({
    required String country,
    required String location,
    @JsonKey(name: "created_at") required String createdAt,
  }) = _AccidentTimeAndLocationDto;

  factory ReportTimeAndLocationDto.fromJson(Map<String, dynamic> json) =>
      _$ReportTimeAndLocationDtoFromJson(json);
}

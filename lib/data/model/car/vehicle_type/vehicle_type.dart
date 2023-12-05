// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/string_helper.dart';

enum VehicleType {
  @JsonValue('sedan')
  auto,
  @JsonValue('van')
  van,
  @JsonValue('bike')
  moto;

  String get name => toString().split('.').last.capitalize();
}

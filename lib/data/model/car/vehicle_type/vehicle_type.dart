// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/string_helper.dart';
import 'package:hive/hive.dart';

part 'vehicle_type.g.dart';

@HiveType(typeId: 12)
enum VehicleType {
  @HiveField(0)
  @JsonValue('sedan')
  auto,
  @HiveField(1)
  @JsonValue('van')
  van,
  @HiveField(2)
  @JsonValue('bike')
  moto;

  String get name => toString().split('.').last.capitalize();
}

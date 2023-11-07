// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'driver_license_type.g.dart';

@HiveType(typeId: 1)
enum DriverLicenseType {
  @HiveField(0)
  @JsonValue('AM')
  am,
  @HiveField(2)
  @JsonValue('A1')
  a1,
  @HiveField(3)
  @JsonValue('A2')
  a2,
  @HiveField(4)
  @JsonValue('A')
  a,
  @HiveField(5)
  @JsonValue('B1')
  b1,
  @HiveField(6)
  @JsonValue('B')
  b,
  @HiveField(7)
  @JsonValue('C1')
  c1,
  @HiveField(8)
  @JsonValue('C')
  c,
  @HiveField(9)
  @JsonValue('D1')
  d1,
  @HiveField(10)
  @JsonValue('D')
  d,
  @HiveField(11)
  @JsonValue('C1E')
  be,
  @HiveField(12)
  @JsonValue('CE')
  c1e,
  @HiveField(13)
  @JsonValue('D1E')
  ce,
  @HiveField(14)
  @JsonValue('DE')
  d1e,
  @HiveField(15)
  @JsonValue('T')
  de;

  String get name => toString().split('.').last.toUpperCase();
}

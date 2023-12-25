// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/string_helper.dart';

enum VehicleType {
  @JsonValue('sedan')
  auto,
  @JsonValue('van')
  van,
  @JsonValue('bike')
  moto,
}

extension VehicleTypeExtension on VehicleType {
  //
  String get title {
    switch (this) {
      case VehicleType.moto:
        return 'strMyMoto'.tr();

      case VehicleType.van:
        return 'strMyVan'.tr();

      default:
        return 'strMyCar'.tr();
    }
  }

  String get image {
    switch (this) {
      case VehicleType.moto:
        return AppDrawables.motoImage;

      case VehicleType.van:
        return AppDrawables.vanImage;

      default:
        return AppDrawables.vehicle;
    }
  }

  double get width {
    switch (this) {
      case VehicleType.moto:
        return 259;

      case VehicleType.van:
        return 284;

      default:
        return 305;
    }
  }

  double get height {
    switch (this) {
      case VehicleType.auto:
        return 137;

      default:
        return 149;
    }
  }

  String get name => toString().split('.').last.capitalize();
}

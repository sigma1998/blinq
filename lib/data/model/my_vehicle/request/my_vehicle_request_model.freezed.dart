// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_vehicle_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyVehicleRequestModel _$MyVehicleRequestModelFromJson(
    Map<String, dynamic> json) {
  return _MyVehicleRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MyVehicleRequestModel {
  @JsonKey(name: 'traveled_km')
  String? get traveledKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_technical')
  String? get nextTechnical => throw _privateConstructorUsedError;
  @JsonKey(name: 'oil_replacement')
  String? get oilReplacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyVehicleRequestModelCopyWith<MyVehicleRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyVehicleRequestModelCopyWith<$Res> {
  factory $MyVehicleRequestModelCopyWith(MyVehicleRequestModel value,
          $Res Function(MyVehicleRequestModel) then) =
      _$MyVehicleRequestModelCopyWithImpl<$Res, MyVehicleRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      String? batteryReplacementDate});
}

/// @nodoc
class _$MyVehicleRequestModelCopyWithImpl<$Res,
        $Val extends MyVehicleRequestModel>
    implements $MyVehicleRequestModelCopyWith<$Res> {
  _$MyVehicleRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
  }) {
    return _then(_value.copyWith(
      traveledKm: freezed == traveledKm
          ? _value.traveledKm
          : traveledKm // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTechnical: freezed == nextTechnical
          ? _value.nextTechnical
          : nextTechnical // ignore: cast_nullable_to_non_nullable
              as String?,
      oilReplacement: freezed == oilReplacement
          ? _value.oilReplacement
          : oilReplacement // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacementDate: freezed == batteryReplacementDate
          ? _value.batteryReplacementDate
          : batteryReplacementDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyVehicleRequestModelImplCopyWith<$Res>
    implements $MyVehicleRequestModelCopyWith<$Res> {
  factory _$$MyVehicleRequestModelImplCopyWith(
          _$MyVehicleRequestModelImpl value,
          $Res Function(_$MyVehicleRequestModelImpl) then) =
      __$$MyVehicleRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      String? batteryReplacementDate});
}

/// @nodoc
class __$$MyVehicleRequestModelImplCopyWithImpl<$Res>
    extends _$MyVehicleRequestModelCopyWithImpl<$Res,
        _$MyVehicleRequestModelImpl>
    implements _$$MyVehicleRequestModelImplCopyWith<$Res> {
  __$$MyVehicleRequestModelImplCopyWithImpl(_$MyVehicleRequestModelImpl _value,
      $Res Function(_$MyVehicleRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
  }) {
    return _then(_$MyVehicleRequestModelImpl(
      traveledKm: freezed == traveledKm
          ? _value.traveledKm
          : traveledKm // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTechnical: freezed == nextTechnical
          ? _value.nextTechnical
          : nextTechnical // ignore: cast_nullable_to_non_nullable
              as String?,
      oilReplacement: freezed == oilReplacement
          ? _value.oilReplacement
          : oilReplacement // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacementDate: freezed == batteryReplacementDate
          ? _value.batteryReplacementDate
          : batteryReplacementDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyVehicleRequestModelImpl implements _MyVehicleRequestModel {
  const _$MyVehicleRequestModelImpl(
      {@JsonKey(name: 'traveled_km') this.traveledKm,
      @JsonKey(name: 'next_technical') this.nextTechnical,
      @JsonKey(name: 'oil_replacement') this.oilReplacement,
      @JsonKey(name: 'battery_replacement_date') this.batteryReplacementDate});

  factory _$MyVehicleRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyVehicleRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'traveled_km')
  final String? traveledKm;
  @override
  @JsonKey(name: 'next_technical')
  final String? nextTechnical;
  @override
  @JsonKey(name: 'oil_replacement')
  final String? oilReplacement;
  @override
  @JsonKey(name: 'battery_replacement_date')
  final String? batteryReplacementDate;

  @override
  String toString() {
    return 'MyVehicleRequestModel(traveledKm: $traveledKm, nextTechnical: $nextTechnical, oilReplacement: $oilReplacement, batteryReplacementDate: $batteryReplacementDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyVehicleRequestModelImpl &&
            (identical(other.traveledKm, traveledKm) ||
                other.traveledKm == traveledKm) &&
            (identical(other.nextTechnical, nextTechnical) ||
                other.nextTechnical == nextTechnical) &&
            (identical(other.oilReplacement, oilReplacement) ||
                other.oilReplacement == oilReplacement) &&
            (identical(other.batteryReplacementDate, batteryReplacementDate) ||
                other.batteryReplacementDate == batteryReplacementDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, traveledKm, nextTechnical,
      oilReplacement, batteryReplacementDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyVehicleRequestModelImplCopyWith<_$MyVehicleRequestModelImpl>
      get copyWith => __$$MyVehicleRequestModelImplCopyWithImpl<
          _$MyVehicleRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyVehicleRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MyVehicleRequestModel implements MyVehicleRequestModel {
  const factory _MyVehicleRequestModel(
      {@JsonKey(name: 'traveled_km') final String? traveledKm,
      @JsonKey(name: 'next_technical') final String? nextTechnical,
      @JsonKey(name: 'oil_replacement') final String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      final String? batteryReplacementDate}) = _$MyVehicleRequestModelImpl;

  factory _MyVehicleRequestModel.fromJson(Map<String, dynamic> json) =
      _$MyVehicleRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'traveled_km')
  String? get traveledKm;
  @override
  @JsonKey(name: 'next_technical')
  String? get nextTechnical;
  @override
  @JsonKey(name: 'oil_replacement')
  String? get oilReplacement;
  @override
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate;
  @override
  @JsonKey(ignore: true)
  _$$MyVehicleRequestModelImplCopyWith<_$MyVehicleRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

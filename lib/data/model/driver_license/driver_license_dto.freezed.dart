// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_license_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriverLicenseDto _$DriverLicenseDtoFromJson(Map<String, dynamic> json) {
  return _DriverLicenseDto.fromJson(json);
}

/// @nodoc
mixin _$DriverLicenseDto {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  DateTime? get issueDate => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get licenseType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverLicenseDtoCopyWith<DriverLicenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverLicenseDtoCopyWith<$Res> {
  factory $DriverLicenseDtoCopyWith(
          DriverLicenseDto value, $Res Function(DriverLicenseDto) then) =
      _$DriverLicenseDtoCopyWithImpl<$Res, DriverLicenseDto>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      DateTime? dateOfBirth,
      DateTime? issueDate,
      DateTime? expirationDate,
      String licenseNumber,
      String licenseType});
}

/// @nodoc
class _$DriverLicenseDtoCopyWithImpl<$Res, $Val extends DriverLicenseDto>
    implements $DriverLicenseDtoCopyWith<$Res> {
  _$DriverLicenseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = freezed,
    Object? issueDate = freezed,
    Object? expirationDate = freezed,
    Object? licenseNumber = null,
    Object? licenseType = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverLicenseDtoImplCopyWith<$Res>
    implements $DriverLicenseDtoCopyWith<$Res> {
  factory _$$DriverLicenseDtoImplCopyWith(_$DriverLicenseDtoImpl value,
          $Res Function(_$DriverLicenseDtoImpl) then) =
      __$$DriverLicenseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      DateTime? dateOfBirth,
      DateTime? issueDate,
      DateTime? expirationDate,
      String licenseNumber,
      String licenseType});
}

/// @nodoc
class __$$DriverLicenseDtoImplCopyWithImpl<$Res>
    extends _$DriverLicenseDtoCopyWithImpl<$Res, _$DriverLicenseDtoImpl>
    implements _$$DriverLicenseDtoImplCopyWith<$Res> {
  __$$DriverLicenseDtoImplCopyWithImpl(_$DriverLicenseDtoImpl _value,
      $Res Function(_$DriverLicenseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = freezed,
    Object? issueDate = freezed,
    Object? expirationDate = freezed,
    Object? licenseNumber = null,
    Object? licenseType = null,
  }) {
    return _then(_$DriverLicenseDtoImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverLicenseDtoImpl implements _DriverLicenseDto {
  const _$DriverLicenseDtoImpl(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.issueDate,
      required this.expirationDate,
      required this.licenseNumber,
      required this.licenseType});

  factory _$DriverLicenseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverLicenseDtoImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final DateTime? dateOfBirth;
  @override
  final DateTime? issueDate;
  @override
  final DateTime? expirationDate;
  @override
  final String licenseNumber;
  @override
  final String licenseType;

  @override
  String toString() {
    return 'DriverLicenseDto(firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, issueDate: $issueDate, expirationDate: $expirationDate, licenseNumber: $licenseNumber, licenseType: $licenseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverLicenseDtoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseType, licenseType) ||
                other.licenseType == licenseType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, dateOfBirth,
      issueDate, expirationDate, licenseNumber, licenseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverLicenseDtoImplCopyWith<_$DriverLicenseDtoImpl> get copyWith =>
      __$$DriverLicenseDtoImplCopyWithImpl<_$DriverLicenseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverLicenseDtoImplToJson(
      this,
    );
  }
}

abstract class _DriverLicenseDto implements DriverLicenseDto {
  const factory _DriverLicenseDto(
      {required final String firstName,
      required final String lastName,
      required final DateTime? dateOfBirth,
      required final DateTime? issueDate,
      required final DateTime? expirationDate,
      required final String licenseNumber,
      required final String licenseType}) = _$DriverLicenseDtoImpl;

  factory _DriverLicenseDto.fromJson(Map<String, dynamic> json) =
      _$DriverLicenseDtoImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  DateTime? get dateOfBirth;
  @override
  DateTime? get issueDate;
  @override
  DateTime? get expirationDate;
  @override
  String get licenseNumber;
  @override
  String get licenseType;
  @override
  @JsonKey(ignore: true)
  _$$DriverLicenseDtoImplCopyWith<_$DriverLicenseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

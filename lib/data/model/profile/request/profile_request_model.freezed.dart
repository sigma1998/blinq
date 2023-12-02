// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileRequestModel _$ProfileRequestModelFromJson(Map<String, dynamic> json) {
  return _ProfileRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileRequestModel {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license')
  DriverLicenseType? get driverLicense => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_expired_date')
  String? get driverLicenseExpiredDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileRequestModelCopyWith<ProfileRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileRequestModelCopyWith<$Res> {
  factory $ProfileRequestModelCopyWith(
          ProfileRequestModel value, $Res Function(ProfileRequestModel) then) =
      _$ProfileRequestModelCopyWithImpl<$Res, ProfileRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'birth_date') String? birthDate,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'driver_license') DriverLicenseType? driverLicense,
      @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_expired_date')
      String? driverLicenseExpiredDate});
}

/// @nodoc
class _$ProfileRequestModelCopyWithImpl<$Res, $Val extends ProfileRequestModel>
    implements $ProfileRequestModelCopyWith<$Res> {
  _$ProfileRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? postalCode = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseExpiredDate = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicense: freezed == driverLicense
          ? _value.driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as DriverLicenseType?,
      driverLicenseNumber: freezed == driverLicenseNumber
          ? _value.driverLicenseNumber
          : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicenseExpiredDate: freezed == driverLicenseExpiredDate
          ? _value.driverLicenseExpiredDate
          : driverLicenseExpiredDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileRequestModelImplCopyWith<$Res>
    implements $ProfileRequestModelCopyWith<$Res> {
  factory _$$ProfileRequestModelImplCopyWith(_$ProfileRequestModelImpl value,
          $Res Function(_$ProfileRequestModelImpl) then) =
      __$$ProfileRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'birth_date') String? birthDate,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'driver_license') DriverLicenseType? driverLicense,
      @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_expired_date')
      String? driverLicenseExpiredDate});
}

/// @nodoc
class __$$ProfileRequestModelImplCopyWithImpl<$Res>
    extends _$ProfileRequestModelCopyWithImpl<$Res, _$ProfileRequestModelImpl>
    implements _$$ProfileRequestModelImplCopyWith<$Res> {
  __$$ProfileRequestModelImplCopyWithImpl(_$ProfileRequestModelImpl _value,
      $Res Function(_$ProfileRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? postalCode = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseExpiredDate = freezed,
  }) {
    return _then(_$ProfileRequestModelImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicense: freezed == driverLicense
          ? _value.driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as DriverLicenseType?,
      driverLicenseNumber: freezed == driverLicenseNumber
          ? _value.driverLicenseNumber
          : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicenseExpiredDate: freezed == driverLicenseExpiredDate
          ? _value.driverLicenseExpiredDate
          : driverLicenseExpiredDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileRequestModelImpl implements _ProfileRequestModel {
  const _$ProfileRequestModelImpl(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'birth_date') this.birthDate,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'driver_license') this.driverLicense,
      @JsonKey(name: 'driver_license_number') this.driverLicenseNumber,
      @JsonKey(name: 'driver_license_expired_date')
      this.driverLicenseExpiredDate});

  factory _$ProfileRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'driver_license')
  final DriverLicenseType? driverLicense;
  @override
  @JsonKey(name: 'driver_license_number')
  final String? driverLicenseNumber;
  @override
  @JsonKey(name: 'driver_license_expired_date')
  final String? driverLicenseExpiredDate;

  @override
  String toString() {
    return 'ProfileRequestModel(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, country: $country, address: $address, phoneNumber: $phoneNumber, postalCode: $postalCode, driverLicense: $driverLicense, driverLicenseNumber: $driverLicenseNumber, driverLicenseExpiredDate: $driverLicenseExpiredDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRequestModelImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.driverLicense, driverLicense) ||
                other.driverLicense == driverLicense) &&
            (identical(other.driverLicenseNumber, driverLicenseNumber) ||
                other.driverLicenseNumber == driverLicenseNumber) &&
            (identical(
                    other.driverLicenseExpiredDate, driverLicenseExpiredDate) ||
                other.driverLicenseExpiredDate == driverLicenseExpiredDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      birthDate,
      country,
      address,
      phoneNumber,
      postalCode,
      driverLicense,
      driverLicenseNumber,
      driverLicenseExpiredDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRequestModelImplCopyWith<_$ProfileRequestModelImpl> get copyWith =>
      __$$ProfileRequestModelImplCopyWithImpl<_$ProfileRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileRequestModel implements ProfileRequestModel {
  const factory _ProfileRequestModel(
      {@JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'birth_date') final String? birthDate,
      @JsonKey(name: 'country') final String? country,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      @JsonKey(name: 'postal_code') final String? postalCode,
      @JsonKey(name: 'driver_license') final DriverLicenseType? driverLicense,
      @JsonKey(name: 'driver_license_number') final String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_expired_date')
      final String? driverLicenseExpiredDate}) = _$ProfileRequestModelImpl;

  factory _ProfileRequestModel.fromJson(Map<String, dynamic> json) =
      _$ProfileRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'birth_date')
  String? get birthDate;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'driver_license')
  DriverLicenseType? get driverLicense;
  @override
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber;
  @override
  @JsonKey(name: 'driver_license_expired_date')
  String? get driverLicenseExpiredDate;
  @override
  @JsonKey(ignore: true)
  _$$ProfileRequestModelImplCopyWith<_$ProfileRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

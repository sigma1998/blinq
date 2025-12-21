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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  String? get city => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_licenses')
  List<int>? get driverLicense => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_country')
  String? get driverLicenseCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_expired_date')
  String? get driverLicenseExpiredDate => throw _privateConstructorUsedError;

  /// Serializes this ProfileRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String? city,
      String? street,
      String? state,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? email,
      @JsonKey(name: 'driver_licenses') List<int>? driverLicense,
      @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_country') String? driverLicenseCountry,
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

  /// Create a copy of ProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? street = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseCountry = freezed,
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
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicense: freezed == driverLicense
          ? _value.driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      driverLicenseNumber: freezed == driverLicenseNumber
          ? _value.driverLicenseNumber
          : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicenseCountry: freezed == driverLicenseCountry
          ? _value.driverLicenseCountry
          : driverLicenseCountry // ignore: cast_nullable_to_non_nullable
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
      String? city,
      String? street,
      String? state,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? email,
      @JsonKey(name: 'driver_licenses') List<int>? driverLicense,
      @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_country') String? driverLicenseCountry,
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

  /// Create a copy of ProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? street = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseCountry = freezed,
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
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicense: freezed == driverLicense
          ? _value._driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      driverLicenseNumber: freezed == driverLicenseNumber
          ? _value.driverLicenseNumber
          : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicenseCountry: freezed == driverLicenseCountry
          ? _value.driverLicenseCountry
          : driverLicenseCountry // ignore: cast_nullable_to_non_nullable
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
      this.city,
      this.street,
      this.state,
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      this.email,
      @JsonKey(name: 'driver_licenses') final List<int>? driverLicense,
      @JsonKey(name: 'driver_license_number') this.driverLicenseNumber,
      @JsonKey(name: 'driver_license_country') this.driverLicenseCountry,
      @JsonKey(name: 'driver_license_expired_date')
      this.driverLicenseExpiredDate})
      : _driverLicense = driverLicense;

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
  final String? city;
  @override
  final String? street;
  @override
  final String? state;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final String? email;
  final List<int>? _driverLicense;
  @override
  @JsonKey(name: 'driver_licenses')
  List<int>? get driverLicense {
    final value = _driverLicense;
    if (value == null) return null;
    if (_driverLicense is EqualUnmodifiableListView) return _driverLicense;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'driver_license_number')
  final String? driverLicenseNumber;
  @override
  @JsonKey(name: 'driver_license_country')
  final String? driverLicenseCountry;
  @override
  @JsonKey(name: 'driver_license_expired_date')
  final String? driverLicenseExpiredDate;

  @override
  String toString() {
    return 'ProfileRequestModel(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, country: $country, city: $city, street: $street, state: $state, postalCode: $postalCode, phoneNumber: $phoneNumber, email: $email, driverLicense: $driverLicense, driverLicenseNumber: $driverLicenseNumber, driverLicenseCountry: $driverLicenseCountry, driverLicenseExpiredDate: $driverLicenseExpiredDate)';
  }

  @override
  bool operator ==(Object other) {
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
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._driverLicense, _driverLicense) &&
            (identical(other.driverLicenseNumber, driverLicenseNumber) ||
                other.driverLicenseNumber == driverLicenseNumber) &&
            (identical(other.driverLicenseCountry, driverLicenseCountry) ||
                other.driverLicenseCountry == driverLicenseCountry) &&
            (identical(
                    other.driverLicenseExpiredDate, driverLicenseExpiredDate) ||
                other.driverLicenseExpiredDate == driverLicenseExpiredDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      birthDate,
      country,
      city,
      street,
      state,
      postalCode,
      phoneNumber,
      email,
      const DeepCollectionEquality().hash(_driverLicense),
      driverLicenseNumber,
      driverLicenseCountry,
      driverLicenseExpiredDate);

  /// Create a copy of ProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final String? city,
      final String? street,
      final String? state,
      @JsonKey(name: 'postal_code') final String? postalCode,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      final String? email,
      @JsonKey(name: 'driver_licenses') final List<int>? driverLicense,
      @JsonKey(name: 'driver_license_number') final String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_country')
      final String? driverLicenseCountry,
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
  String? get city;
  @override
  String? get street;
  @override
  String? get state;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  String? get email;
  @override
  @JsonKey(name: 'driver_licenses')
  List<int>? get driverLicense;
  @override
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber;
  @override
  @JsonKey(name: 'driver_license_country')
  String? get driverLicenseCountry;
  @override
  @JsonKey(name: 'driver_license_expired_date')
  String? get driverLicenseExpiredDate;

  /// Create a copy of ProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRequestModelImplCopyWith<_$ProfileRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

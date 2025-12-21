// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileResponseModel _$ProfileResponseModelFromJson(Map<String, dynamic> json) {
  return _ProfileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileResponseModel {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code')
  String? get qrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_licenses')
  List<String>? get driverLicense => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_country')
  String? get driverLicenseCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license_expired_date')
  String? get driverLicenseExpiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'usersvehicledatas')
  CarResponseModel? get car => throw _privateConstructorUsedError;
  @JsonKey(name: 'policy_holder')
  PolicyHolderResponseModel? get policyHolder =>
      throw _privateConstructorUsedError;
  @JsonKey()
  InsuranceResponseModel? get insurance => throw _privateConstructorUsedError;

  /// Serializes this ProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileResponseModelCopyWith<ProfileResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileResponseModelCopyWith<$Res> {
  factory $ProfileResponseModelCopyWith(ProfileResponseModel value,
          $Res Function(ProfileResponseModel) then) =
      _$ProfileResponseModelCopyWithImpl<$Res, ProfileResponseModel>;
  @useResult
  $Res call(
      {int? id,
      String? image,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'birth_date') String? birthDate,
      @JsonKey(name: 'country') String? country,
      String? city,
      String? state,
      String? street,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'qr_code') String? qrCode,
      @JsonKey(name: 'driver_licenses') List<String>? driverLicense,
      @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_country') String? driverLicenseCountry,
      @JsonKey(name: 'driver_license_expired_date')
      String? driverLicenseExpiredDate,
      @JsonKey(name: 'usersvehicledatas') CarResponseModel? car,
      @JsonKey(name: 'policy_holder') PolicyHolderResponseModel? policyHolder,
      @JsonKey() InsuranceResponseModel? insurance});

  $CarResponseModelCopyWith<$Res>? get car;
  $PolicyHolderResponseModelCopyWith<$Res>? get policyHolder;
  $InsuranceResponseModelCopyWith<$Res>? get insurance;
}

/// @nodoc
class _$ProfileResponseModelCopyWithImpl<$Res,
        $Val extends ProfileResponseModel>
    implements $ProfileResponseModelCopyWith<$Res> {
  _$ProfileResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? street = freezed,
    Object? postalCode = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? qrCode = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseCountry = freezed,
    Object? driverLicenseExpiredDate = freezed,
    Object? car = freezed,
    Object? policyHolder = freezed,
    Object? insurance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
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
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicense: freezed == driverLicense
          ? _value.driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as CarResponseModel?,
      policyHolder: freezed == policyHolder
          ? _value.policyHolder
          : policyHolder // ignore: cast_nullable_to_non_nullable
              as PolicyHolderResponseModel?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as InsuranceResponseModel?,
    ) as $Val);
  }

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarResponseModelCopyWith<$Res>? get car {
    if (_value.car == null) {
      return null;
    }

    return $CarResponseModelCopyWith<$Res>(_value.car!, (value) {
      return _then(_value.copyWith(car: value) as $Val);
    });
  }

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PolicyHolderResponseModelCopyWith<$Res>? get policyHolder {
    if (_value.policyHolder == null) {
      return null;
    }

    return $PolicyHolderResponseModelCopyWith<$Res>(_value.policyHolder!,
        (value) {
      return _then(_value.copyWith(policyHolder: value) as $Val);
    });
  }

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InsuranceResponseModelCopyWith<$Res>? get insurance {
    if (_value.insurance == null) {
      return null;
    }

    return $InsuranceResponseModelCopyWith<$Res>(_value.insurance!, (value) {
      return _then(_value.copyWith(insurance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileResponseModelImplCopyWith<$Res>
    implements $ProfileResponseModelCopyWith<$Res> {
  factory _$$ProfileResponseModelImplCopyWith(_$ProfileResponseModelImpl value,
          $Res Function(_$ProfileResponseModelImpl) then) =
      __$$ProfileResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? image,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'birth_date') String? birthDate,
      @JsonKey(name: 'country') String? country,
      String? city,
      String? state,
      String? street,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'qr_code') String? qrCode,
      @JsonKey(name: 'driver_licenses') List<String>? driverLicense,
      @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_country') String? driverLicenseCountry,
      @JsonKey(name: 'driver_license_expired_date')
      String? driverLicenseExpiredDate,
      @JsonKey(name: 'usersvehicledatas') CarResponseModel? car,
      @JsonKey(name: 'policy_holder') PolicyHolderResponseModel? policyHolder,
      @JsonKey() InsuranceResponseModel? insurance});

  @override
  $CarResponseModelCopyWith<$Res>? get car;
  @override
  $PolicyHolderResponseModelCopyWith<$Res>? get policyHolder;
  @override
  $InsuranceResponseModelCopyWith<$Res>? get insurance;
}

/// @nodoc
class __$$ProfileResponseModelImplCopyWithImpl<$Res>
    extends _$ProfileResponseModelCopyWithImpl<$Res, _$ProfileResponseModelImpl>
    implements _$$ProfileResponseModelImplCopyWith<$Res> {
  __$$ProfileResponseModelImplCopyWithImpl(_$ProfileResponseModelImpl _value,
      $Res Function(_$ProfileResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? street = freezed,
    Object? postalCode = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? qrCode = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseCountry = freezed,
    Object? driverLicenseExpiredDate = freezed,
    Object? car = freezed,
    Object? policyHolder = freezed,
    Object? insurance = freezed,
  }) {
    return _then(_$ProfileResponseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
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
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicense: freezed == driverLicense
          ? _value._driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as CarResponseModel?,
      policyHolder: freezed == policyHolder
          ? _value.policyHolder
          : policyHolder // ignore: cast_nullable_to_non_nullable
              as PolicyHolderResponseModel?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as InsuranceResponseModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileResponseModelImpl extends _ProfileResponseModel {
  const _$ProfileResponseModelImpl(
      {this.id,
      this.image,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'birth_date') this.birthDate,
      @JsonKey(name: 'country') this.country,
      this.city,
      this.state,
      this.street,
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'qr_code') this.qrCode,
      @JsonKey(name: 'driver_licenses') final List<String>? driverLicense,
      @JsonKey(name: 'driver_license_number') this.driverLicenseNumber,
      @JsonKey(name: 'driver_license_country') this.driverLicenseCountry,
      @JsonKey(name: 'driver_license_expired_date')
      this.driverLicenseExpiredDate,
      @JsonKey(name: 'usersvehicledatas') this.car,
      @JsonKey(name: 'policy_holder') this.policyHolder,
      @JsonKey() this.insurance})
      : _driverLicense = driverLicense,
        super._();

  factory _$ProfileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileResponseModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
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
  final String? state;
  @override
  final String? street;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'qr_code')
  final String? qrCode;
  final List<String>? _driverLicense;
  @override
  @JsonKey(name: 'driver_licenses')
  List<String>? get driverLicense {
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
  @JsonKey(name: 'usersvehicledatas')
  final CarResponseModel? car;
  @override
  @JsonKey(name: 'policy_holder')
  final PolicyHolderResponseModel? policyHolder;
  @override
  @JsonKey()
  final InsuranceResponseModel? insurance;

  @override
  String toString() {
    return 'ProfileResponseModel(id: $id, image: $image, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, country: $country, city: $city, state: $state, street: $street, postalCode: $postalCode, address: $address, phoneNumber: $phoneNumber, email: $email, qrCode: $qrCode, driverLicense: $driverLicense, driverLicenseNumber: $driverLicenseNumber, driverLicenseCountry: $driverLicenseCountry, driverLicenseExpiredDate: $driverLicenseExpiredDate, car: $car, policyHolder: $policyHolder, insurance: $insurance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            const DeepCollectionEquality()
                .equals(other._driverLicense, _driverLicense) &&
            (identical(other.driverLicenseNumber, driverLicenseNumber) ||
                other.driverLicenseNumber == driverLicenseNumber) &&
            (identical(other.driverLicenseCountry, driverLicenseCountry) ||
                other.driverLicenseCountry == driverLicenseCountry) &&
            (identical(
                    other.driverLicenseExpiredDate, driverLicenseExpiredDate) ||
                other.driverLicenseExpiredDate == driverLicenseExpiredDate) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.policyHolder, policyHolder) ||
                other.policyHolder == policyHolder) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        image,
        firstName,
        lastName,
        birthDate,
        country,
        city,
        state,
        street,
        postalCode,
        address,
        phoneNumber,
        email,
        qrCode,
        const DeepCollectionEquality().hash(_driverLicense),
        driverLicenseNumber,
        driverLicenseCountry,
        driverLicenseExpiredDate,
        car,
        policyHolder,
        insurance
      ]);

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileResponseModelImplCopyWith<_$ProfileResponseModelImpl>
      get copyWith =>
          __$$ProfileResponseModelImplCopyWithImpl<_$ProfileResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileResponseModel extends ProfileResponseModel {
  const factory _ProfileResponseModel(
      {final int? id,
      final String? image,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'birth_date') final String? birthDate,
      @JsonKey(name: 'country') final String? country,
      final String? city,
      final String? state,
      final String? street,
      @JsonKey(name: 'postal_code') final String? postalCode,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'qr_code') final String? qrCode,
      @JsonKey(name: 'driver_licenses') final List<String>? driverLicense,
      @JsonKey(name: 'driver_license_number') final String? driverLicenseNumber,
      @JsonKey(name: 'driver_license_country')
      final String? driverLicenseCountry,
      @JsonKey(name: 'driver_license_expired_date')
      final String? driverLicenseExpiredDate,
      @JsonKey(name: 'usersvehicledatas') final CarResponseModel? car,
      @JsonKey(name: 'policy_holder')
      final PolicyHolderResponseModel? policyHolder,
      @JsonKey()
      final InsuranceResponseModel? insurance}) = _$ProfileResponseModelImpl;
  const _ProfileResponseModel._() : super._();

  factory _ProfileResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProfileResponseModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get image;
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
  String? get state;
  @override
  String? get street;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'qr_code')
  String? get qrCode;
  @override
  @JsonKey(name: 'driver_licenses')
  List<String>? get driverLicense;
  @override
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber;
  @override
  @JsonKey(name: 'driver_license_country')
  String? get driverLicenseCountry;
  @override
  @JsonKey(name: 'driver_license_expired_date')
  String? get driverLicenseExpiredDate;
  @override
  @JsonKey(name: 'usersvehicledatas')
  CarResponseModel? get car;
  @override
  @JsonKey(name: 'policy_holder')
  PolicyHolderResponseModel? get policyHolder;
  @override
  @JsonKey()
  InsuranceResponseModel? get insurance;

  /// Create a copy of ProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileResponseModelImplCopyWith<_$ProfileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

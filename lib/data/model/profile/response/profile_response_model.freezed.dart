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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileResponseModel _$ProfileResponseModelFromJson(Map<String, dynamic> json) {
  return _ProfileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileResponseModel {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @HiveField(0)
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'qr_code')
  String? get qrCode => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'driver_license')
  DriverLicenseType? get driverLicense => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'driver_license_expired_date')
  @HiveField(11)
  String? get driverLicenseExpiredDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @HiveField(0) @JsonKey(name: 'first_name') String? firstName,
      @HiveField(1) @JsonKey(name: 'last_name') String? lastName,
      @HiveField(2) @JsonKey(name: 'birth_date') String? birthDate,
      @HiveField(3) @JsonKey(name: 'country') String? country,
      @HiveField(4) @JsonKey(name: 'address') String? address,
      @HiveField(5) @JsonKey(name: 'phone_number') String? phoneNumber,
      @HiveField(6) @JsonKey(name: 'email') String? email,
      @HiveField(7) @JsonKey(name: 'qr_code') String? qrCode,
      @HiveField(8)
      @JsonKey(name: 'driver_license')
      DriverLicenseType? driverLicense,
      @HiveField(9)
      @JsonKey(name: 'driver_license_number')
      String? driverLicenseNumber,
      @HiveField(10)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(11)
      String? driverLicenseExpiredDate});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? qrCode = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseExpiredDate = freezed,
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
      @HiveField(0) @JsonKey(name: 'first_name') String? firstName,
      @HiveField(1) @JsonKey(name: 'last_name') String? lastName,
      @HiveField(2) @JsonKey(name: 'birth_date') String? birthDate,
      @HiveField(3) @JsonKey(name: 'country') String? country,
      @HiveField(4) @JsonKey(name: 'address') String? address,
      @HiveField(5) @JsonKey(name: 'phone_number') String? phoneNumber,
      @HiveField(6) @JsonKey(name: 'email') String? email,
      @HiveField(7) @JsonKey(name: 'qr_code') String? qrCode,
      @HiveField(8)
      @JsonKey(name: 'driver_license')
      DriverLicenseType? driverLicense,
      @HiveField(9)
      @JsonKey(name: 'driver_license_number')
      String? driverLicenseNumber,
      @HiveField(10)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(11)
      String? driverLicenseExpiredDate});
}

/// @nodoc
class __$$ProfileResponseModelImplCopyWithImpl<$Res>
    extends _$ProfileResponseModelCopyWithImpl<$Res, _$ProfileResponseModelImpl>
    implements _$$ProfileResponseModelImplCopyWith<$Res> {
  __$$ProfileResponseModelImplCopyWithImpl(_$ProfileResponseModelImpl _value,
      $Res Function(_$ProfileResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? qrCode = freezed,
    Object? driverLicense = freezed,
    Object? driverLicenseNumber = freezed,
    Object? driverLicenseExpiredDate = freezed,
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
class _$ProfileResponseModelImpl implements _ProfileResponseModel {
  const _$ProfileResponseModelImpl(
      {this.id,
      this.image,
      @HiveField(0) @JsonKey(name: 'first_name') this.firstName,
      @HiveField(1) @JsonKey(name: 'last_name') this.lastName,
      @HiveField(2) @JsonKey(name: 'birth_date') this.birthDate,
      @HiveField(3) @JsonKey(name: 'country') this.country,
      @HiveField(4) @JsonKey(name: 'address') this.address,
      @HiveField(5) @JsonKey(name: 'phone_number') this.phoneNumber,
      @HiveField(6) @JsonKey(name: 'email') this.email,
      @HiveField(7) @JsonKey(name: 'qr_code') this.qrCode,
      @HiveField(8) @JsonKey(name: 'driver_license') this.driverLicense,
      @HiveField(9)
      @JsonKey(name: 'driver_license_number')
      this.driverLicenseNumber,
      @HiveField(10)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(11)
      this.driverLicenseExpiredDate});

  factory _$ProfileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileResponseModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  @HiveField(0)
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @HiveField(2)
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  @override
  @HiveField(3)
  @JsonKey(name: 'country')
  final String? country;
  @override
  @HiveField(4)
  @JsonKey(name: 'address')
  final String? address;
  @override
  @HiveField(5)
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @HiveField(6)
  @JsonKey(name: 'email')
  final String? email;
  @override
  @HiveField(7)
  @JsonKey(name: 'qr_code')
  final String? qrCode;
  @override
  @HiveField(8)
  @JsonKey(name: 'driver_license')
  final DriverLicenseType? driverLicense;
  @override
  @HiveField(9)
  @JsonKey(name: 'driver_license_number')
  final String? driverLicenseNumber;
  @override
  @HiveField(10)
  @JsonKey(name: 'driver_license_expired_date')
  @HiveField(11)
  final String? driverLicenseExpiredDate;

  @override
  String toString() {
    return 'ProfileResponseModel(id: $id, image: $image, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, country: $country, address: $address, phoneNumber: $phoneNumber, email: $email, qrCode: $qrCode, driverLicense: $driverLicense, driverLicenseNumber: $driverLicenseNumber, driverLicenseExpiredDate: $driverLicenseExpiredDate)';
  }

  @override
  bool operator ==(dynamic other) {
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
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
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
      id,
      image,
      firstName,
      lastName,
      birthDate,
      country,
      address,
      phoneNumber,
      email,
      qrCode,
      driverLicense,
      driverLicenseNumber,
      driverLicenseExpiredDate);

  @JsonKey(ignore: true)
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

abstract class _ProfileResponseModel implements ProfileResponseModel {
  const factory _ProfileResponseModel(
      {final int? id,
      final String? image,
      @HiveField(0) @JsonKey(name: 'first_name') final String? firstName,
      @HiveField(1) @JsonKey(name: 'last_name') final String? lastName,
      @HiveField(2) @JsonKey(name: 'birth_date') final String? birthDate,
      @HiveField(3) @JsonKey(name: 'country') final String? country,
      @HiveField(4) @JsonKey(name: 'address') final String? address,
      @HiveField(5) @JsonKey(name: 'phone_number') final String? phoneNumber,
      @HiveField(6) @JsonKey(name: 'email') final String? email,
      @HiveField(7) @JsonKey(name: 'qr_code') final String? qrCode,
      @HiveField(8)
      @JsonKey(name: 'driver_license')
      final DriverLicenseType? driverLicense,
      @HiveField(9)
      @JsonKey(name: 'driver_license_number')
      final String? driverLicenseNumber,
      @HiveField(10)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(11)
      final String? driverLicenseExpiredDate}) = _$ProfileResponseModelImpl;

  factory _ProfileResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProfileResponseModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  @HiveField(0)
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @HiveField(2)
  @JsonKey(name: 'birth_date')
  String? get birthDate;
  @override
  @HiveField(3)
  @JsonKey(name: 'country')
  String? get country;
  @override
  @HiveField(4)
  @JsonKey(name: 'address')
  String? get address;
  @override
  @HiveField(5)
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @HiveField(6)
  @JsonKey(name: 'email')
  String? get email;
  @override
  @HiveField(7)
  @JsonKey(name: 'qr_code')
  String? get qrCode;
  @override
  @HiveField(8)
  @JsonKey(name: 'driver_license')
  DriverLicenseType? get driverLicense;
  @override
  @HiveField(9)
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber;
  @override
  @HiveField(10)
  @JsonKey(name: 'driver_license_expired_date')
  @HiveField(11)
  String? get driverLicenseExpiredDate;
  @override
  @JsonKey(ignore: true)
  _$$ProfileResponseModelImplCopyWith<_$ProfileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

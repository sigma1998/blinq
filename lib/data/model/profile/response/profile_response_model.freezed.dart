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
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'qr_code')
  String? get qrCode => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'driver_license')
  DriverLicenseType? get driverLicense => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'driver_license_expired_date')
  @HiveField(13)
  String? get driverLicenseExpiredDate => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey()
  CarResponseModel? get car => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'policy_holder')
  PolicyHolderResponseModel? get policyHolder =>
      throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey()
  InsuranceResponseModel? get insurance => throw _privateConstructorUsedError;
  @HiveField(17)
  @JsonKey(name: 'usersvehicledatas')
  UserVehicleResponseModel? get userVehicle =>
      throw _privateConstructorUsedError;

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
      {@HiveField(0) int? id,
      @HiveField(1) String? image,
      @HiveField(2) @JsonKey(name: 'first_name') String? firstName,
      @HiveField(3) @JsonKey(name: 'last_name') String? lastName,
      @HiveField(4) @JsonKey(name: 'birth_date') String? birthDate,
      @HiveField(5) @JsonKey(name: 'country') String? country,
      @HiveField(6) @JsonKey(name: 'address') String? address,
      @HiveField(7) @JsonKey(name: 'phone_number') String? phoneNumber,
      @HiveField(8) @JsonKey(name: 'email') String? email,
      @HiveField(9) @JsonKey(name: 'qr_code') String? qrCode,
      @HiveField(10)
      @JsonKey(name: 'driver_license')
      DriverLicenseType? driverLicense,
      @HiveField(11)
      @JsonKey(name: 'driver_license_number')
      String? driverLicenseNumber,
      @HiveField(12)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(13)
      String? driverLicenseExpiredDate,
      @HiveField(14) @JsonKey() CarResponseModel? car,
      @HiveField(15)
      @JsonKey(name: 'policy_holder')
      PolicyHolderResponseModel? policyHolder,
      @HiveField(16) @JsonKey() InsuranceResponseModel? insurance,
      @HiveField(17)
      @JsonKey(name: 'usersvehicledatas')
      UserVehicleResponseModel? userVehicle});

  $CarResponseModelCopyWith<$Res>? get car;
  $PolicyHolderResponseModelCopyWith<$Res>? get policyHolder;
  $InsuranceResponseModelCopyWith<$Res>? get insurance;
  $UserVehicleResponseModelCopyWith<$Res>? get userVehicle;
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
    Object? car = freezed,
    Object? policyHolder = freezed,
    Object? insurance = freezed,
    Object? userVehicle = freezed,
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
      userVehicle: freezed == userVehicle
          ? _value.userVehicle
          : userVehicle // ignore: cast_nullable_to_non_nullable
              as UserVehicleResponseModel?,
    ) as $Val);
  }

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

  @override
  @pragma('vm:prefer-inline')
  $UserVehicleResponseModelCopyWith<$Res>? get userVehicle {
    if (_value.userVehicle == null) {
      return null;
    }

    return $UserVehicleResponseModelCopyWith<$Res>(_value.userVehicle!,
        (value) {
      return _then(_value.copyWith(userVehicle: value) as $Val);
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
      {@HiveField(0) int? id,
      @HiveField(1) String? image,
      @HiveField(2) @JsonKey(name: 'first_name') String? firstName,
      @HiveField(3) @JsonKey(name: 'last_name') String? lastName,
      @HiveField(4) @JsonKey(name: 'birth_date') String? birthDate,
      @HiveField(5) @JsonKey(name: 'country') String? country,
      @HiveField(6) @JsonKey(name: 'address') String? address,
      @HiveField(7) @JsonKey(name: 'phone_number') String? phoneNumber,
      @HiveField(8) @JsonKey(name: 'email') String? email,
      @HiveField(9) @JsonKey(name: 'qr_code') String? qrCode,
      @HiveField(10)
      @JsonKey(name: 'driver_license')
      DriverLicenseType? driverLicense,
      @HiveField(11)
      @JsonKey(name: 'driver_license_number')
      String? driverLicenseNumber,
      @HiveField(12)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(13)
      String? driverLicenseExpiredDate,
      @HiveField(14) @JsonKey() CarResponseModel? car,
      @HiveField(15)
      @JsonKey(name: 'policy_holder')
      PolicyHolderResponseModel? policyHolder,
      @HiveField(16) @JsonKey() InsuranceResponseModel? insurance,
      @HiveField(17)
      @JsonKey(name: 'usersvehicledatas')
      UserVehicleResponseModel? userVehicle});

  @override
  $CarResponseModelCopyWith<$Res>? get car;
  @override
  $PolicyHolderResponseModelCopyWith<$Res>? get policyHolder;
  @override
  $InsuranceResponseModelCopyWith<$Res>? get insurance;
  @override
  $UserVehicleResponseModelCopyWith<$Res>? get userVehicle;
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
    Object? car = freezed,
    Object? policyHolder = freezed,
    Object? insurance = freezed,
    Object? userVehicle = freezed,
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
      userVehicle: freezed == userVehicle
          ? _value.userVehicle
          : userVehicle // ignore: cast_nullable_to_non_nullable
              as UserVehicleResponseModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileResponseModelImpl extends _ProfileResponseModel {
  const _$ProfileResponseModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.image,
      @HiveField(2) @JsonKey(name: 'first_name') this.firstName,
      @HiveField(3) @JsonKey(name: 'last_name') this.lastName,
      @HiveField(4) @JsonKey(name: 'birth_date') this.birthDate,
      @HiveField(5) @JsonKey(name: 'country') this.country,
      @HiveField(6) @JsonKey(name: 'address') this.address,
      @HiveField(7) @JsonKey(name: 'phone_number') this.phoneNumber,
      @HiveField(8) @JsonKey(name: 'email') this.email,
      @HiveField(9) @JsonKey(name: 'qr_code') this.qrCode,
      @HiveField(10) @JsonKey(name: 'driver_license') this.driverLicense,
      @HiveField(11)
      @JsonKey(name: 'driver_license_number')
      this.driverLicenseNumber,
      @HiveField(12)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(13)
      this.driverLicenseExpiredDate,
      @HiveField(14) @JsonKey() this.car,
      @HiveField(15) @JsonKey(name: 'policy_holder') this.policyHolder,
      @HiveField(16) @JsonKey() this.insurance,
      @HiveField(17) @JsonKey(name: 'usersvehicledatas') this.userVehicle})
      : super._();

  factory _$ProfileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileResponseModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? image;
  @override
  @HiveField(2)
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @HiveField(3)
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @HiveField(4)
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  @override
  @HiveField(5)
  @JsonKey(name: 'country')
  final String? country;
  @override
  @HiveField(6)
  @JsonKey(name: 'address')
  final String? address;
  @override
  @HiveField(7)
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @HiveField(8)
  @JsonKey(name: 'email')
  final String? email;
  @override
  @HiveField(9)
  @JsonKey(name: 'qr_code')
  final String? qrCode;
  @override
  @HiveField(10)
  @JsonKey(name: 'driver_license')
  final DriverLicenseType? driverLicense;
  @override
  @HiveField(11)
  @JsonKey(name: 'driver_license_number')
  final String? driverLicenseNumber;
  @override
  @HiveField(12)
  @JsonKey(name: 'driver_license_expired_date')
  @HiveField(13)
  final String? driverLicenseExpiredDate;
  @override
  @HiveField(14)
  @JsonKey()
  final CarResponseModel? car;
  @override
  @HiveField(15)
  @JsonKey(name: 'policy_holder')
  final PolicyHolderResponseModel? policyHolder;
  @override
  @HiveField(16)
  @JsonKey()
  final InsuranceResponseModel? insurance;
  @override
  @HiveField(17)
  @JsonKey(name: 'usersvehicledatas')
  final UserVehicleResponseModel? userVehicle;

  @override
  String toString() {
    return 'ProfileResponseModel(id: $id, image: $image, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, country: $country, address: $address, phoneNumber: $phoneNumber, email: $email, qrCode: $qrCode, driverLicense: $driverLicense, driverLicenseNumber: $driverLicenseNumber, driverLicenseExpiredDate: $driverLicenseExpiredDate, car: $car, policyHolder: $policyHolder, insurance: $insurance, userVehicle: $userVehicle)';
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
                other.driverLicenseExpiredDate == driverLicenseExpiredDate) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.policyHolder, policyHolder) ||
                other.policyHolder == policyHolder) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance) &&
            (identical(other.userVehicle, userVehicle) ||
                other.userVehicle == userVehicle));
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
      driverLicenseExpiredDate,
      car,
      policyHolder,
      insurance,
      userVehicle);

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

abstract class _ProfileResponseModel extends ProfileResponseModel {
  const factory _ProfileResponseModel(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? image,
      @HiveField(2) @JsonKey(name: 'first_name') final String? firstName,
      @HiveField(3) @JsonKey(name: 'last_name') final String? lastName,
      @HiveField(4) @JsonKey(name: 'birth_date') final String? birthDate,
      @HiveField(5) @JsonKey(name: 'country') final String? country,
      @HiveField(6) @JsonKey(name: 'address') final String? address,
      @HiveField(7) @JsonKey(name: 'phone_number') final String? phoneNumber,
      @HiveField(8) @JsonKey(name: 'email') final String? email,
      @HiveField(9) @JsonKey(name: 'qr_code') final String? qrCode,
      @HiveField(10)
      @JsonKey(name: 'driver_license')
      final DriverLicenseType? driverLicense,
      @HiveField(11)
      @JsonKey(name: 'driver_license_number')
      final String? driverLicenseNumber,
      @HiveField(12)
      @JsonKey(name: 'driver_license_expired_date')
      @HiveField(13)
      final String? driverLicenseExpiredDate,
      @HiveField(14) @JsonKey() final CarResponseModel? car,
      @HiveField(15)
      @JsonKey(name: 'policy_holder')
      final PolicyHolderResponseModel? policyHolder,
      @HiveField(16) @JsonKey() final InsuranceResponseModel? insurance,
      @HiveField(17)
      @JsonKey(name: 'usersvehicledatas')
      final UserVehicleResponseModel?
          userVehicle}) = _$ProfileResponseModelImpl;
  const _ProfileResponseModel._() : super._();

  factory _ProfileResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProfileResponseModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get image;
  @override
  @HiveField(2)
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @HiveField(3)
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @HiveField(4)
  @JsonKey(name: 'birth_date')
  String? get birthDate;
  @override
  @HiveField(5)
  @JsonKey(name: 'country')
  String? get country;
  @override
  @HiveField(6)
  @JsonKey(name: 'address')
  String? get address;
  @override
  @HiveField(7)
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @HiveField(8)
  @JsonKey(name: 'email')
  String? get email;
  @override
  @HiveField(9)
  @JsonKey(name: 'qr_code')
  String? get qrCode;
  @override
  @HiveField(10)
  @JsonKey(name: 'driver_license')
  DriverLicenseType? get driverLicense;
  @override
  @HiveField(11)
  @JsonKey(name: 'driver_license_number')
  String? get driverLicenseNumber;
  @override
  @HiveField(12)
  @JsonKey(name: 'driver_license_expired_date')
  @HiveField(13)
  String? get driverLicenseExpiredDate;
  @override
  @HiveField(14)
  @JsonKey()
  CarResponseModel? get car;
  @override
  @HiveField(15)
  @JsonKey(name: 'policy_holder')
  PolicyHolderResponseModel? get policyHolder;
  @override
  @HiveField(16)
  @JsonKey()
  InsuranceResponseModel? get insurance;
  @override
  @HiveField(17)
  @JsonKey(name: 'usersvehicledatas')
  UserVehicleResponseModel? get userVehicle;
  @override
  @JsonKey(ignore: true)
  _$$ProfileResponseModelImplCopyWith<_$ProfileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

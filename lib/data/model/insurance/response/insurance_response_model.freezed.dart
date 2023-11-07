// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InsuranceResponseModel _$InsuranceResponseModelFromJson(
    Map<String, dynamic> json) {
  return _InsuranceResponseModel.fromJson(json);
}

/// @nodoc
mixin _$InsuranceResponseModel {
  @HiveField(0)
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'policy_number')
  String? get policyNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'green_card_number')
  String? get greenCardNumber => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'certificate_valid_from')
  String? get certificateValidFrom => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'certificate_valid_to')
  String? get certificateValidTo => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'agency')
  String? get agency => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'policy_cover')
  String? get policyCover => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsuranceResponseModelCopyWith<InsuranceResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsuranceResponseModelCopyWith<$Res> {
  factory $InsuranceResponseModelCopyWith(InsuranceResponseModel value,
          $Res Function(InsuranceResponseModel) then) =
      _$InsuranceResponseModelCopyWithImpl<$Res, InsuranceResponseModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'name') String? name,
      @HiveField(1) @JsonKey(name: 'policy_number') String? policyNumber,
      @HiveField(2) @JsonKey(name: 'green_card_number') String? greenCardNumber,
      @HiveField(3)
      @JsonKey(name: 'certificate_valid_from')
      String? certificateValidFrom,
      @HiveField(4)
      @JsonKey(name: 'certificate_valid_to')
      String? certificateValidTo,
      @HiveField(5) @JsonKey(name: 'agency') String? agency,
      @HiveField(6) @JsonKey(name: 'country') String? country,
      @HiveField(7) @JsonKey(name: 'address') String? address,
      @HiveField(8) @JsonKey(name: 'email') String? email,
      @HiveField(9) @JsonKey(name: 'policy_cover') String? policyCover});
}

/// @nodoc
class _$InsuranceResponseModelCopyWithImpl<$Res,
        $Val extends InsuranceResponseModel>
    implements $InsuranceResponseModelCopyWith<$Res> {
  _$InsuranceResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? policyNumber = freezed,
    Object? greenCardNumber = freezed,
    Object? certificateValidFrom = freezed,
    Object? certificateValidTo = freezed,
    Object? agency = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? email = freezed,
    Object? policyCover = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      policyNumber: freezed == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      greenCardNumber: freezed == greenCardNumber
          ? _value.greenCardNumber
          : greenCardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateValidFrom: freezed == certificateValidFrom
          ? _value.certificateValidFrom
          : certificateValidFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateValidTo: freezed == certificateValidTo
          ? _value.certificateValidTo
          : certificateValidTo // ignore: cast_nullable_to_non_nullable
              as String?,
      agency: freezed == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      policyCover: freezed == policyCover
          ? _value.policyCover
          : policyCover // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsuranceResponseModelImplCopyWith<$Res>
    implements $InsuranceResponseModelCopyWith<$Res> {
  factory _$$InsuranceResponseModelImplCopyWith(
          _$InsuranceResponseModelImpl value,
          $Res Function(_$InsuranceResponseModelImpl) then) =
      __$$InsuranceResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'name') String? name,
      @HiveField(1) @JsonKey(name: 'policy_number') String? policyNumber,
      @HiveField(2) @JsonKey(name: 'green_card_number') String? greenCardNumber,
      @HiveField(3)
      @JsonKey(name: 'certificate_valid_from')
      String? certificateValidFrom,
      @HiveField(4)
      @JsonKey(name: 'certificate_valid_to')
      String? certificateValidTo,
      @HiveField(5) @JsonKey(name: 'agency') String? agency,
      @HiveField(6) @JsonKey(name: 'country') String? country,
      @HiveField(7) @JsonKey(name: 'address') String? address,
      @HiveField(8) @JsonKey(name: 'email') String? email,
      @HiveField(9) @JsonKey(name: 'policy_cover') String? policyCover});
}

/// @nodoc
class __$$InsuranceResponseModelImplCopyWithImpl<$Res>
    extends _$InsuranceResponseModelCopyWithImpl<$Res,
        _$InsuranceResponseModelImpl>
    implements _$$InsuranceResponseModelImplCopyWith<$Res> {
  __$$InsuranceResponseModelImplCopyWithImpl(
      _$InsuranceResponseModelImpl _value,
      $Res Function(_$InsuranceResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? policyNumber = freezed,
    Object? greenCardNumber = freezed,
    Object? certificateValidFrom = freezed,
    Object? certificateValidTo = freezed,
    Object? agency = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? email = freezed,
    Object? policyCover = freezed,
  }) {
    return _then(_$InsuranceResponseModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      policyNumber: freezed == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      greenCardNumber: freezed == greenCardNumber
          ? _value.greenCardNumber
          : greenCardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateValidFrom: freezed == certificateValidFrom
          ? _value.certificateValidFrom
          : certificateValidFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateValidTo: freezed == certificateValidTo
          ? _value.certificateValidTo
          : certificateValidTo // ignore: cast_nullable_to_non_nullable
              as String?,
      agency: freezed == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      policyCover: freezed == policyCover
          ? _value.policyCover
          : policyCover // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsuranceResponseModelImpl implements _InsuranceResponseModel {
  const _$InsuranceResponseModelImpl(
      {@HiveField(0) @JsonKey(name: 'name') this.name,
      @HiveField(1) @JsonKey(name: 'policy_number') this.policyNumber,
      @HiveField(2) @JsonKey(name: 'green_card_number') this.greenCardNumber,
      @HiveField(3)
      @JsonKey(name: 'certificate_valid_from')
      this.certificateValidFrom,
      @HiveField(4)
      @JsonKey(name: 'certificate_valid_to')
      this.certificateValidTo,
      @HiveField(5) @JsonKey(name: 'agency') this.agency,
      @HiveField(6) @JsonKey(name: 'country') this.country,
      @HiveField(7) @JsonKey(name: 'address') this.address,
      @HiveField(8) @JsonKey(name: 'email') this.email,
      @HiveField(9) @JsonKey(name: 'policy_cover') this.policyCover});

  factory _$InsuranceResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsuranceResponseModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'name')
  final String? name;
  @override
  @HiveField(1)
  @JsonKey(name: 'policy_number')
  final String? policyNumber;
  @override
  @HiveField(2)
  @JsonKey(name: 'green_card_number')
  final String? greenCardNumber;
  @override
  @HiveField(3)
  @JsonKey(name: 'certificate_valid_from')
  final String? certificateValidFrom;
  @override
  @HiveField(4)
  @JsonKey(name: 'certificate_valid_to')
  final String? certificateValidTo;
  @override
  @HiveField(5)
  @JsonKey(name: 'agency')
  final String? agency;
  @override
  @HiveField(6)
  @JsonKey(name: 'country')
  final String? country;
  @override
  @HiveField(7)
  @JsonKey(name: 'address')
  final String? address;
  @override
  @HiveField(8)
  @JsonKey(name: 'email')
  final String? email;
  @override
  @HiveField(9)
  @JsonKey(name: 'policy_cover')
  final String? policyCover;

  @override
  String toString() {
    return 'InsuranceResponseModel(name: $name, policyNumber: $policyNumber, greenCardNumber: $greenCardNumber, certificateValidFrom: $certificateValidFrom, certificateValidTo: $certificateValidTo, agency: $agency, country: $country, address: $address, email: $email, policyCover: $policyCover)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsuranceResponseModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.policyNumber, policyNumber) ||
                other.policyNumber == policyNumber) &&
            (identical(other.greenCardNumber, greenCardNumber) ||
                other.greenCardNumber == greenCardNumber) &&
            (identical(other.certificateValidFrom, certificateValidFrom) ||
                other.certificateValidFrom == certificateValidFrom) &&
            (identical(other.certificateValidTo, certificateValidTo) ||
                other.certificateValidTo == certificateValidTo) &&
            (identical(other.agency, agency) || other.agency == agency) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.policyCover, policyCover) ||
                other.policyCover == policyCover));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      policyNumber,
      greenCardNumber,
      certificateValidFrom,
      certificateValidTo,
      agency,
      country,
      address,
      email,
      policyCover);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsuranceResponseModelImplCopyWith<_$InsuranceResponseModelImpl>
      get copyWith => __$$InsuranceResponseModelImplCopyWithImpl<
          _$InsuranceResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsuranceResponseModelImplToJson(
      this,
    );
  }
}

abstract class _InsuranceResponseModel implements InsuranceResponseModel {
  const factory _InsuranceResponseModel(
      {@HiveField(0) @JsonKey(name: 'name') final String? name,
      @HiveField(1) @JsonKey(name: 'policy_number') final String? policyNumber,
      @HiveField(2)
      @JsonKey(name: 'green_card_number')
      final String? greenCardNumber,
      @HiveField(3)
      @JsonKey(name: 'certificate_valid_from')
      final String? certificateValidFrom,
      @HiveField(4)
      @JsonKey(name: 'certificate_valid_to')
      final String? certificateValidTo,
      @HiveField(5) @JsonKey(name: 'agency') final String? agency,
      @HiveField(6) @JsonKey(name: 'country') final String? country,
      @HiveField(7) @JsonKey(name: 'address') final String? address,
      @HiveField(8) @JsonKey(name: 'email') final String? email,
      @HiveField(9)
      @JsonKey(name: 'policy_cover')
      final String? policyCover}) = _$InsuranceResponseModelImpl;

  factory _InsuranceResponseModel.fromJson(Map<String, dynamic> json) =
      _$InsuranceResponseModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'name')
  String? get name;
  @override
  @HiveField(1)
  @JsonKey(name: 'policy_number')
  String? get policyNumber;
  @override
  @HiveField(2)
  @JsonKey(name: 'green_card_number')
  String? get greenCardNumber;
  @override
  @HiveField(3)
  @JsonKey(name: 'certificate_valid_from')
  String? get certificateValidFrom;
  @override
  @HiveField(4)
  @JsonKey(name: 'certificate_valid_to')
  String? get certificateValidTo;
  @override
  @HiveField(5)
  @JsonKey(name: 'agency')
  String? get agency;
  @override
  @HiveField(6)
  @JsonKey(name: 'country')
  String? get country;
  @override
  @HiveField(7)
  @JsonKey(name: 'address')
  String? get address;
  @override
  @HiveField(8)
  @JsonKey(name: 'email')
  String? get email;
  @override
  @HiveField(9)
  @JsonKey(name: 'policy_cover')
  String? get policyCover;
  @override
  @JsonKey(ignore: true)
  _$$InsuranceResponseModelImplCopyWith<_$InsuranceResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

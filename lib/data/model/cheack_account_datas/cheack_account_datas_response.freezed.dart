// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cheack_account_datas_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckAccountResponse _$CheckAccountResponseFromJson(Map<String, dynamic> json) {
  return _CheckAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckAccountResponse {
  bool get account => throw _privateConstructorUsedError;
  bool get car => throw _privateConstructorUsedError;
  bool get insurance => throw _privateConstructorUsedError;
  @JsonKey(name: "policy_holder")
  bool get policyHolder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckAccountResponseCopyWith<CheckAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckAccountResponseCopyWith<$Res> {
  factory $CheckAccountResponseCopyWith(CheckAccountResponse value,
          $Res Function(CheckAccountResponse) then) =
      _$CheckAccountResponseCopyWithImpl<$Res, CheckAccountResponse>;
  @useResult
  $Res call(
      {bool account,
      bool car,
      bool insurance,
      @JsonKey(name: "policy_holder") bool policyHolder});
}

/// @nodoc
class _$CheckAccountResponseCopyWithImpl<$Res,
        $Val extends CheckAccountResponse>
    implements $CheckAccountResponseCopyWith<$Res> {
  _$CheckAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? car = null,
    Object? insurance = null,
    Object? policyHolder = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as bool,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as bool,
      insurance: null == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as bool,
      policyHolder: null == policyHolder
          ? _value.policyHolder
          : policyHolder // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckAccountResponseImplCopyWith<$Res>
    implements $CheckAccountResponseCopyWith<$Res> {
  factory _$$CheckAccountResponseImplCopyWith(_$CheckAccountResponseImpl value,
          $Res Function(_$CheckAccountResponseImpl) then) =
      __$$CheckAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool account,
      bool car,
      bool insurance,
      @JsonKey(name: "policy_holder") bool policyHolder});
}

/// @nodoc
class __$$CheckAccountResponseImplCopyWithImpl<$Res>
    extends _$CheckAccountResponseCopyWithImpl<$Res, _$CheckAccountResponseImpl>
    implements _$$CheckAccountResponseImplCopyWith<$Res> {
  __$$CheckAccountResponseImplCopyWithImpl(_$CheckAccountResponseImpl _value,
      $Res Function(_$CheckAccountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? car = null,
    Object? insurance = null,
    Object? policyHolder = null,
  }) {
    return _then(_$CheckAccountResponseImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as bool,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as bool,
      insurance: null == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as bool,
      policyHolder: null == policyHolder
          ? _value.policyHolder
          : policyHolder // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckAccountResponseImpl implements _CheckAccountResponse {
  const _$CheckAccountResponseImpl(
      {required this.account,
      required this.car,
      required this.insurance,
      @JsonKey(name: "policy_holder") required this.policyHolder});

  factory _$CheckAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckAccountResponseImplFromJson(json);

  @override
  final bool account;
  @override
  final bool car;
  @override
  final bool insurance;
  @override
  @JsonKey(name: "policy_holder")
  final bool policyHolder;

  @override
  String toString() {
    return 'CheckAccountResponse(account: $account, car: $car, insurance: $insurance, policyHolder: $policyHolder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAccountResponseImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance) &&
            (identical(other.policyHolder, policyHolder) ||
                other.policyHolder == policyHolder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, account, car, insurance, policyHolder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckAccountResponseImplCopyWith<_$CheckAccountResponseImpl>
      get copyWith =>
          __$$CheckAccountResponseImplCopyWithImpl<_$CheckAccountResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckAccountResponse implements CheckAccountResponse {
  const factory _CheckAccountResponse(
          {required final bool account,
          required final bool car,
          required final bool insurance,
          @JsonKey(name: "policy_holder") required final bool policyHolder}) =
      _$CheckAccountResponseImpl;

  factory _CheckAccountResponse.fromJson(Map<String, dynamic> json) =
      _$CheckAccountResponseImpl.fromJson;

  @override
  bool get account;
  @override
  bool get car;
  @override
  bool get insurance;
  @override
  @JsonKey(name: "policy_holder")
  bool get policyHolder;
  @override
  @JsonKey(ignore: true)
  _$$CheckAccountResponseImplCopyWith<_$CheckAccountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

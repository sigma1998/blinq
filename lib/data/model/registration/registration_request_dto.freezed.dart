// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistrationRequestDto _$RegistrationRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _RegistrationRequestDto.fromJson(json);
}

/// @nodoc
mixin _$RegistrationRequestDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationRequestDtoCopyWith<RegistrationRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationRequestDtoCopyWith<$Res> {
  factory $RegistrationRequestDtoCopyWith(RegistrationRequestDto value,
          $Res Function(RegistrationRequestDto) then) =
      _$RegistrationRequestDtoCopyWithImpl<$Res, RegistrationRequestDto>;
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName});
}

/// @nodoc
class _$RegistrationRequestDtoCopyWithImpl<$Res,
        $Val extends RegistrationRequestDto>
    implements $RegistrationRequestDtoCopyWith<$Res> {
  _$RegistrationRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationRequestDtoImplCopyWith<$Res>
    implements $RegistrationRequestDtoCopyWith<$Res> {
  factory _$$RegistrationRequestDtoImplCopyWith(
          _$RegistrationRequestDtoImpl value,
          $Res Function(_$RegistrationRequestDtoImpl) then) =
      __$$RegistrationRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName});
}

/// @nodoc
class __$$RegistrationRequestDtoImplCopyWithImpl<$Res>
    extends _$RegistrationRequestDtoCopyWithImpl<$Res,
        _$RegistrationRequestDtoImpl>
    implements _$$RegistrationRequestDtoImplCopyWith<$Res> {
  __$$RegistrationRequestDtoImplCopyWithImpl(
      _$RegistrationRequestDtoImpl _value,
      $Res Function(_$RegistrationRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$RegistrationRequestDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationRequestDtoImpl implements _RegistrationRequestDto {
  const _$RegistrationRequestDtoImpl(
      {required this.email,
      required this.password,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName});

  factory _$RegistrationRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationRequestDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  @override
  String toString() {
    return 'RegistrationRequestDto(email: $email, password: $password, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationRequestDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationRequestDtoImplCopyWith<_$RegistrationRequestDtoImpl>
      get copyWith => __$$RegistrationRequestDtoImplCopyWithImpl<
          _$RegistrationRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _RegistrationRequestDto implements RegistrationRequestDto {
  const factory _RegistrationRequestDto(
          {required final String email,
          required final String password,
          @JsonKey(name: 'first_name') required final String firstName,
          @JsonKey(name: 'last_name') required final String lastName}) =
      _$RegistrationRequestDtoImpl;

  factory _RegistrationRequestDto.fromJson(Map<String, dynamic> json) =
      _$RegistrationRequestDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationRequestDtoImplCopyWith<_$RegistrationRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

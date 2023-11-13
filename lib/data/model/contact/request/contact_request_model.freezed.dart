// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactRequestModel _$ContactRequestModelFromJson(Map<String, dynamic> json) {
  return _ContactRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ContactRequestModel {
  @JsonKey(name: 'name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_emergency')
  String? get isEmergency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactRequestModelCopyWith<ContactRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactRequestModelCopyWith<$Res> {
  factory $ContactRequestModelCopyWith(
          ContactRequestModel value, $Res Function(ContactRequestModel) then) =
      _$ContactRequestModelCopyWithImpl<$Res, ContactRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'is_emergency') String? isEmergency});
}

/// @nodoc
class _$ContactRequestModelCopyWithImpl<$Res, $Val extends ContactRequestModel>
    implements $ContactRequestModelCopyWith<$Res> {
  _$ContactRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? isEmergency = freezed,
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmergency: freezed == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactRequestModelImplCopyWith<$Res>
    implements $ContactRequestModelCopyWith<$Res> {
  factory _$$ContactRequestModelImplCopyWith(_$ContactRequestModelImpl value,
          $Res Function(_$ContactRequestModelImpl) then) =
      __$$ContactRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'is_emergency') String? isEmergency});
}

/// @nodoc
class __$$ContactRequestModelImplCopyWithImpl<$Res>
    extends _$ContactRequestModelCopyWithImpl<$Res, _$ContactRequestModelImpl>
    implements _$$ContactRequestModelImplCopyWith<$Res> {
  __$$ContactRequestModelImplCopyWithImpl(_$ContactRequestModelImpl _value,
      $Res Function(_$ContactRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? isEmergency = freezed,
  }) {
    return _then(_$ContactRequestModelImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmergency: freezed == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactRequestModelImpl implements _ContactRequestModel {
  const _$ContactRequestModelImpl(
      {@JsonKey(name: 'name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'is_emergency') this.isEmergency});

  factory _$ContactRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'is_emergency')
  final String? isEmergency;

  @override
  String toString() {
    return 'ContactRequestModel(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, isEmergency: $isEmergency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactRequestModelImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, phoneNumber, isEmergency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactRequestModelImplCopyWith<_$ContactRequestModelImpl> get copyWith =>
      __$$ContactRequestModelImplCopyWithImpl<_$ContactRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ContactRequestModel implements ContactRequestModel {
  const factory _ContactRequestModel(
          {@JsonKey(name: 'name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'phone_number') final String? phoneNumber,
          @JsonKey(name: 'is_emergency') final String? isEmergency}) =
      _$ContactRequestModelImpl;

  factory _ContactRequestModel.fromJson(Map<String, dynamic> json) =
      _$ContactRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'is_emergency')
  String? get isEmergency;
  @override
  @JsonKey(ignore: true)
  _$$ContactRequestModelImplCopyWith<_$ContactRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

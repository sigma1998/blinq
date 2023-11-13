// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactResponseModel _$ContactResponseModelFromJson(Map<String, dynamic> json) {
  return _ContactResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ContactResponseModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'name')
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'is_emergency')
  bool? get isEmergency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactResponseModelCopyWith<ContactResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactResponseModelCopyWith<$Res> {
  factory $ContactResponseModelCopyWith(ContactResponseModel value,
          $Res Function(ContactResponseModel) then) =
      _$ContactResponseModelCopyWithImpl<$Res, ContactResponseModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? image,
      @HiveField(2) @JsonKey(name: 'name') String? firstName,
      @HiveField(3) @JsonKey(name: 'last_name') String? lastName,
      @HiveField(4) @JsonKey(name: 'phone_number') String? phoneNumber,
      @HiveField(5) @JsonKey(name: 'is_emergency') bool? isEmergency});
}

/// @nodoc
class _$ContactResponseModelCopyWithImpl<$Res,
        $Val extends ContactResponseModel>
    implements $ContactResponseModelCopyWith<$Res> {
  _$ContactResponseModelCopyWithImpl(this._value, this._then);

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
    Object? phoneNumber = freezed,
    Object? isEmergency = freezed,
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmergency: freezed == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactResponseModelImplCopyWith<$Res>
    implements $ContactResponseModelCopyWith<$Res> {
  factory _$$ContactResponseModelImplCopyWith(_$ContactResponseModelImpl value,
          $Res Function(_$ContactResponseModelImpl) then) =
      __$$ContactResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? image,
      @HiveField(2) @JsonKey(name: 'name') String? firstName,
      @HiveField(3) @JsonKey(name: 'last_name') String? lastName,
      @HiveField(4) @JsonKey(name: 'phone_number') String? phoneNumber,
      @HiveField(5) @JsonKey(name: 'is_emergency') bool? isEmergency});
}

/// @nodoc
class __$$ContactResponseModelImplCopyWithImpl<$Res>
    extends _$ContactResponseModelCopyWithImpl<$Res, _$ContactResponseModelImpl>
    implements _$$ContactResponseModelImplCopyWith<$Res> {
  __$$ContactResponseModelImplCopyWithImpl(_$ContactResponseModelImpl _value,
      $Res Function(_$ContactResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? isEmergency = freezed,
  }) {
    return _then(_$ContactResponseModelImpl(
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmergency: freezed == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactResponseModelImpl extends _ContactResponseModel {
  const _$ContactResponseModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.image,
      @HiveField(2) @JsonKey(name: 'name') this.firstName,
      @HiveField(3) @JsonKey(name: 'last_name') this.lastName,
      @HiveField(4) @JsonKey(name: 'phone_number') this.phoneNumber,
      @HiveField(5) @JsonKey(name: 'is_emergency') this.isEmergency})
      : super._();

  factory _$ContactResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactResponseModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? image;
  @override
  @HiveField(2)
  @JsonKey(name: 'name')
  final String? firstName;
  @override
  @HiveField(3)
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @HiveField(4)
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_emergency')
  final bool? isEmergency;

  @override
  String toString() {
    return 'ContactResponseModel(id: $id, image: $image, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, isEmergency: $isEmergency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
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
  int get hashCode => Object.hash(
      runtimeType, id, image, firstName, lastName, phoneNumber, isEmergency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactResponseModelImplCopyWith<_$ContactResponseModelImpl>
      get copyWith =>
          __$$ContactResponseModelImplCopyWithImpl<_$ContactResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ContactResponseModel extends ContactResponseModel {
  const factory _ContactResponseModel(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? image,
      @HiveField(2) @JsonKey(name: 'name') final String? firstName,
      @HiveField(3) @JsonKey(name: 'last_name') final String? lastName,
      @HiveField(4) @JsonKey(name: 'phone_number') final String? phoneNumber,
      @HiveField(5)
      @JsonKey(name: 'is_emergency')
      final bool? isEmergency}) = _$ContactResponseModelImpl;
  const _ContactResponseModel._() : super._();

  factory _ContactResponseModel.fromJson(Map<String, dynamic> json) =
      _$ContactResponseModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get image;
  @override
  @HiveField(2)
  @JsonKey(name: 'name')
  String? get firstName;
  @override
  @HiveField(3)
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @HiveField(4)
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_emergency')
  bool? get isEmergency;
  @override
  @JsonKey(ignore: true)
  _$$ContactResponseModelImplCopyWith<_$ContactResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

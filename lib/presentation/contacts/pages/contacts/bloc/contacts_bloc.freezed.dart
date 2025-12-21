// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactsState {
  Status get status => throw _privateConstructorUsedError;
  ContactResponseDto? get contacts => throw _privateConstructorUsedError;
  bool get isEdit => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of ContactsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactsStateCopyWith<ContactsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsStateCopyWith<$Res> {
  factory $ContactsStateCopyWith(
          ContactsState value, $Res Function(ContactsState) then) =
      _$ContactsStateCopyWithImpl<$Res, ContactsState>;
  @useResult
  $Res call(
      {Status status, ContactResponseDto? contacts, bool isEdit, Error? error});

  $ContactResponseDtoCopyWith<$Res>? get contacts;
}

/// @nodoc
class _$ContactsStateCopyWithImpl<$Res, $Val extends ContactsState>
    implements $ContactsStateCopyWith<$Res> {
  _$ContactsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? contacts = freezed,
    Object? isEdit = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as ContactResponseDto?,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }

  /// Create a copy of ContactsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactResponseDtoCopyWith<$Res>? get contacts {
    if (_value.contacts == null) {
      return null;
    }

    return $ContactResponseDtoCopyWith<$Res>(_value.contacts!, (value) {
      return _then(_value.copyWith(contacts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactsStateImplCopyWith<$Res>
    implements $ContactsStateCopyWith<$Res> {
  factory _$$ContactsStateImplCopyWith(
          _$ContactsStateImpl value, $Res Function(_$ContactsStateImpl) then) =
      __$$ContactsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status, ContactResponseDto? contacts, bool isEdit, Error? error});

  @override
  $ContactResponseDtoCopyWith<$Res>? get contacts;
}

/// @nodoc
class __$$ContactsStateImplCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$ContactsStateImpl>
    implements _$$ContactsStateImplCopyWith<$Res> {
  __$$ContactsStateImplCopyWithImpl(
      _$ContactsStateImpl _value, $Res Function(_$ContactsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? contacts = freezed,
    Object? isEdit = null,
    Object? error = freezed,
  }) {
    return _then(_$ContactsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as ContactResponseDto?,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$ContactsStateImpl implements _ContactsState {
  const _$ContactsStateImpl(
      {this.status = Status.initial,
      this.contacts,
      this.isEdit = false,
      this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final ContactResponseDto? contacts;
  @override
  @JsonKey()
  final bool isEdit;
  @override
  final Error? error;

  @override
  String toString() {
    return 'ContactsState(status: $status, contacts: $contacts, isEdit: $isEdit, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, contacts, isEdit, error);

  /// Create a copy of ContactsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactsStateImplCopyWith<_$ContactsStateImpl> get copyWith =>
      __$$ContactsStateImplCopyWithImpl<_$ContactsStateImpl>(this, _$identity);
}

abstract class _ContactsState implements ContactsState {
  const factory _ContactsState(
      {final Status status,
      final ContactResponseDto? contacts,
      final bool isEdit,
      final Error? error}) = _$ContactsStateImpl;

  @override
  Status get status;
  @override
  ContactResponseDto? get contacts;
  @override
  bool get isEdit;
  @override
  Error? get error;

  /// Create a copy of ContactsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactsStateImplCopyWith<_$ContactsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

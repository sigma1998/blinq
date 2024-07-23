// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countries_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountriesState {
  Status get status => throw _privateConstructorUsedError;
  List<String> get countries => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountriesStateCopyWith<CountriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountriesStateCopyWith<$Res> {
  factory $CountriesStateCopyWith(
          CountriesState value, $Res Function(CountriesState) then) =
      _$CountriesStateCopyWithImpl<$Res, CountriesState>;
  @useResult
  $Res call({Status status, List<String> countries, Error? error});
}

/// @nodoc
class _$CountriesStateCopyWithImpl<$Res, $Val extends CountriesState>
    implements $CountriesStateCopyWith<$Res> {
  _$CountriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? countries = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountriesStateImplCopyWith<$Res>
    implements $CountriesStateCopyWith<$Res> {
  factory _$$CountriesStateImplCopyWith(_$CountriesStateImpl value,
          $Res Function(_$CountriesStateImpl) then) =
      __$$CountriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, List<String> countries, Error? error});
}

/// @nodoc
class __$$CountriesStateImplCopyWithImpl<$Res>
    extends _$CountriesStateCopyWithImpl<$Res, _$CountriesStateImpl>
    implements _$$CountriesStateImplCopyWith<$Res> {
  __$$CountriesStateImplCopyWithImpl(
      _$CountriesStateImpl _value, $Res Function(_$CountriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? countries = null,
    Object? error = freezed,
  }) {
    return _then(_$CountriesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$CountriesStateImpl implements _CountriesState {
  const _$CountriesStateImpl(
      {this.status = Status.initial,
      final List<String> countries = const [],
      this.error})
      : _countries = countries;

  @override
  @JsonKey()
  final Status status;
  final List<String> _countries;
  @override
  @JsonKey()
  List<String> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  final Error? error;

  @override
  String toString() {
    return 'CountriesState(status: $status, countries: $countries, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountriesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_countries), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountriesStateImplCopyWith<_$CountriesStateImpl> get copyWith =>
      __$$CountriesStateImplCopyWithImpl<_$CountriesStateImpl>(
          this, _$identity);
}

abstract class _CountriesState implements CountriesState {
  const factory _CountriesState(
      {final Status status,
      final List<String> countries,
      final Error? error}) = _$CountriesStateImpl;

  @override
  Status get status;
  @override
  List<String> get countries;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$CountriesStateImplCopyWith<_$CountriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

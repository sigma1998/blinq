// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportsScreenState {
  Status get status => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;
  List<HistoryItemModelDto> get accidents => throw _privateConstructorUsedError;
  List<HistoryItemModelDto> get breakdowns =>
      throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportsScreenStateCopyWith<ReportsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsScreenStateCopyWith<$Res> {
  factory $ReportsScreenStateCopyWith(
          ReportsScreenState value, $Res Function(ReportsScreenState) then) =
      _$ReportsScreenStateCopyWithImpl<$Res, ReportsScreenState>;
  @useResult
  $Res call(
      {Status status,
      int pageIndex,
      List<HistoryItemModelDto> accidents,
      List<HistoryItemModelDto> breakdowns,
      bool isDownloading});
}

/// @nodoc
class _$ReportsScreenStateCopyWithImpl<$Res, $Val extends ReportsScreenState>
    implements $ReportsScreenStateCopyWith<$Res> {
  _$ReportsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageIndex = null,
    Object? accidents = null,
    Object? breakdowns = null,
    Object? isDownloading = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      accidents: null == accidents
          ? _value.accidents
          : accidents // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
      breakdowns: null == breakdowns
          ? _value.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportsScreenStateImplCopyWith<$Res>
    implements $ReportsScreenStateCopyWith<$Res> {
  factory _$$ReportsScreenStateImplCopyWith(_$ReportsScreenStateImpl value,
          $Res Function(_$ReportsScreenStateImpl) then) =
      __$$ReportsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      int pageIndex,
      List<HistoryItemModelDto> accidents,
      List<HistoryItemModelDto> breakdowns,
      bool isDownloading});
}

/// @nodoc
class __$$ReportsScreenStateImplCopyWithImpl<$Res>
    extends _$ReportsScreenStateCopyWithImpl<$Res, _$ReportsScreenStateImpl>
    implements _$$ReportsScreenStateImplCopyWith<$Res> {
  __$$ReportsScreenStateImplCopyWithImpl(_$ReportsScreenStateImpl _value,
      $Res Function(_$ReportsScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageIndex = null,
    Object? accidents = null,
    Object? breakdowns = null,
    Object? isDownloading = null,
  }) {
    return _then(_$ReportsScreenStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      accidents: null == accidents
          ? _value._accidents
          : accidents // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
      breakdowns: null == breakdowns
          ? _value._breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReportsScreenStateImpl implements _ReportsScreenState {
  const _$ReportsScreenStateImpl(
      {this.status = Status.initial,
      this.pageIndex = 0,
      final List<HistoryItemModelDto> accidents = const [],
      final List<HistoryItemModelDto> breakdowns = const [],
      this.isDownloading = false})
      : _accidents = accidents,
        _breakdowns = breakdowns;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final int pageIndex;
  final List<HistoryItemModelDto> _accidents;
  @override
  @JsonKey()
  List<HistoryItemModelDto> get accidents {
    if (_accidents is EqualUnmodifiableListView) return _accidents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accidents);
  }

  final List<HistoryItemModelDto> _breakdowns;
  @override
  @JsonKey()
  List<HistoryItemModelDto> get breakdowns {
    if (_breakdowns is EqualUnmodifiableListView) return _breakdowns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakdowns);
  }

  @override
  @JsonKey()
  final bool isDownloading;

  @override
  String toString() {
    return 'ReportsScreenState(status: $status, pageIndex: $pageIndex, accidents: $accidents, breakdowns: $breakdowns, isDownloading: $isDownloading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsScreenStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            const DeepCollectionEquality()
                .equals(other._accidents, _accidents) &&
            const DeepCollectionEquality()
                .equals(other._breakdowns, _breakdowns) &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      pageIndex,
      const DeepCollectionEquality().hash(_accidents),
      const DeepCollectionEquality().hash(_breakdowns),
      isDownloading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsScreenStateImplCopyWith<_$ReportsScreenStateImpl> get copyWith =>
      __$$ReportsScreenStateImplCopyWithImpl<_$ReportsScreenStateImpl>(
          this, _$identity);
}

abstract class _ReportsScreenState implements ReportsScreenState {
  const factory _ReportsScreenState(
      {final Status status,
      final int pageIndex,
      final List<HistoryItemModelDto> accidents,
      final List<HistoryItemModelDto> breakdowns,
      final bool isDownloading}) = _$ReportsScreenStateImpl;

  @override
  Status get status;
  @override
  int get pageIndex;
  @override
  List<HistoryItemModelDto> get accidents;
  @override
  List<HistoryItemModelDto> get breakdowns;
  @override
  bool get isDownloading;
  @override
  @JsonKey(ignore: true)
  _$$ReportsScreenStateImplCopyWith<_$ReportsScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

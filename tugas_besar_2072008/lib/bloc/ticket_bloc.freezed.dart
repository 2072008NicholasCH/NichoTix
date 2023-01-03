// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketEvent {
  DateTime get waktu => throw _privateConstructorUsedError;
  String get tempat => throw _privateConstructorUsedError;
  List<String> get kursi => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime waktu, String tempat, List<String> kursi)
        started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime waktu, String tempat, List<String> kursi)?
        started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime waktu, String tempat, List<String> kursi)?
        started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketEventCopyWith<TicketEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEventCopyWith<$Res> {
  factory $TicketEventCopyWith(
          TicketEvent value, $Res Function(TicketEvent) then) =
      _$TicketEventCopyWithImpl<$Res, TicketEvent>;
  @useResult
  $Res call({DateTime waktu, String tempat, List<String> kursi});
}

/// @nodoc
class _$TicketEventCopyWithImpl<$Res, $Val extends TicketEvent>
    implements $TicketEventCopyWith<$Res> {
  _$TicketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waktu = null,
    Object? tempat = null,
    Object? kursi = null,
  }) {
    return _then(_value.copyWith(
      waktu: null == waktu
          ? _value.waktu
          : waktu // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tempat: null == tempat
          ? _value.tempat
          : tempat // ignore: cast_nullable_to_non_nullable
              as String,
      kursi: null == kursi
          ? _value.kursi
          : kursi // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime waktu, String tempat, List<String> kursi});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waktu = null,
    Object? tempat = null,
    Object? kursi = null,
  }) {
    return _then(_$_Started(
      null == waktu
          ? _value.waktu
          : waktu // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == tempat
          ? _value.tempat
          : tempat // ignore: cast_nullable_to_non_nullable
              as String,
      null == kursi
          ? _value._kursi
          : kursi // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.waktu, this.tempat, final List<String> kursi)
      : _kursi = kursi;

  @override
  final DateTime waktu;
  @override
  final String tempat;
  final List<String> _kursi;
  @override
  List<String> get kursi {
    if (_kursi is EqualUnmodifiableListView) return _kursi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kursi);
  }

  @override
  String toString() {
    return 'TicketEvent.started(waktu: $waktu, tempat: $tempat, kursi: $kursi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.waktu, waktu) || other.waktu == waktu) &&
            (identical(other.tempat, tempat) || other.tempat == tempat) &&
            const DeepCollectionEquality().equals(other._kursi, _kursi));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, waktu, tempat, const DeepCollectionEquality().hash(_kursi));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime waktu, String tempat, List<String> kursi)
        started,
  }) {
    return started(waktu, tempat, kursi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime waktu, String tempat, List<String> kursi)?
        started,
  }) {
    return started?.call(waktu, tempat, kursi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime waktu, String tempat, List<String> kursi)?
        started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(waktu, tempat, kursi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TicketEvent {
  const factory _Started(
          final DateTime waktu, final String tempat, final List<String> kursi) =
      _$_Started;

  @override
  DateTime get waktu;
  @override
  String get tempat;
  @override
  List<String> get kursi;
  @override
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime waktu, String tempat, List<String> kursi)
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DateTime waktu, String tempat, List<String> kursi)?
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime waktu, String tempat, List<String> kursi)?
        running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
          TicketState value, $Res Function(TicketState) then) =
      _$TicketStateCopyWithImpl<$Res, TicketState>;
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TicketState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime waktu, String tempat, List<String> kursi)
        running,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DateTime waktu, String tempat, List<String> kursi)?
        running,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime waktu, String tempat, List<String> kursi)?
        running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TicketState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RunningCopyWith<$Res> {
  factory _$$_RunningCopyWith(
          _$_Running value, $Res Function(_$_Running) then) =
      __$$_RunningCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime waktu, String tempat, List<String> kursi});
}

/// @nodoc
class __$$_RunningCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$_Running>
    implements _$$_RunningCopyWith<$Res> {
  __$$_RunningCopyWithImpl(_$_Running _value, $Res Function(_$_Running) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waktu = null,
    Object? tempat = null,
    Object? kursi = null,
  }) {
    return _then(_$_Running(
      null == waktu
          ? _value.waktu
          : waktu // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == tempat
          ? _value.tempat
          : tempat // ignore: cast_nullable_to_non_nullable
              as String,
      null == kursi
          ? _value._kursi
          : kursi // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Running implements _Running {
  const _$_Running(this.waktu, this.tempat, final List<String> kursi)
      : _kursi = kursi;

  @override
  final DateTime waktu;
  @override
  final String tempat;
  final List<String> _kursi;
  @override
  List<String> get kursi {
    if (_kursi is EqualUnmodifiableListView) return _kursi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kursi);
  }

  @override
  String toString() {
    return 'TicketState.running(waktu: $waktu, tempat: $tempat, kursi: $kursi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Running &&
            (identical(other.waktu, waktu) || other.waktu == waktu) &&
            (identical(other.tempat, tempat) || other.tempat == tempat) &&
            const DeepCollectionEquality().equals(other._kursi, _kursi));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, waktu, tempat, const DeepCollectionEquality().hash(_kursi));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      __$$_RunningCopyWithImpl<_$_Running>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime waktu, String tempat, List<String> kursi)
        running,
  }) {
    return running(waktu, tempat, kursi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DateTime waktu, String tempat, List<String> kursi)?
        running,
  }) {
    return running?.call(waktu, tempat, kursi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime waktu, String tempat, List<String> kursi)?
        running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(waktu, tempat, kursi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class _Running implements TicketState {
  const factory _Running(
          final DateTime waktu, final String tempat, final List<String> kursi) =
      _$_Running;

  DateTime get waktu;
  String get tempat;
  List<String> get kursi;
  @JsonKey(ignore: true)
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      throw _privateConstructorUsedError;
}

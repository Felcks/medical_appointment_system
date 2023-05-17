// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receptionist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Receptionist _$ReceptionistFromJson(Map<String, dynamic> json) {
  return _Receptionist.fromJson(json);
}

/// @nodoc
mixin _$Receptionist {
  String get name => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceptionistCopyWith<Receptionist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceptionistCopyWith<$Res> {
  factory $ReceptionistCopyWith(
          Receptionist value, $Res Function(Receptionist) then) =
      _$ReceptionistCopyWithImpl<$Res, Receptionist>;
  @useResult
  $Res call({String name, DateTime birthDate});
}

/// @nodoc
class _$ReceptionistCopyWithImpl<$Res, $Val extends Receptionist>
    implements $ReceptionistCopyWith<$Res> {
  _$ReceptionistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceptionistCopyWith<$Res>
    implements $ReceptionistCopyWith<$Res> {
  factory _$$_ReceptionistCopyWith(
          _$_Receptionist value, $Res Function(_$_Receptionist) then) =
      __$$_ReceptionistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, DateTime birthDate});
}

/// @nodoc
class __$$_ReceptionistCopyWithImpl<$Res>
    extends _$ReceptionistCopyWithImpl<$Res, _$_Receptionist>
    implements _$$_ReceptionistCopyWith<$Res> {
  __$$_ReceptionistCopyWithImpl(
      _$_Receptionist _value, $Res Function(_$_Receptionist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDate = null,
  }) {
    return _then(_$_Receptionist(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Receptionist with DiagnosticableTreeMixin implements _Receptionist {
  const _$_Receptionist({required this.name, required this.birthDate});

  factory _$_Receptionist.fromJson(Map<String, dynamic> json) =>
      _$$_ReceptionistFromJson(json);

  @override
  final String name;
  @override
  final DateTime birthDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Receptionist(name: $name, birthDate: $birthDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Receptionist'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('birthDate', birthDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Receptionist &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceptionistCopyWith<_$_Receptionist> get copyWith =>
      __$$_ReceptionistCopyWithImpl<_$_Receptionist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceptionistToJson(
      this,
    );
  }
}

abstract class _Receptionist implements Receptionist {
  const factory _Receptionist(
      {required final String name,
      required final DateTime birthDate}) = _$_Receptionist;

  factory _Receptionist.fromJson(Map<String, dynamic> json) =
      _$_Receptionist.fromJson;

  @override
  String get name;
  @override
  DateTime get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReceptionistCopyWith<_$_Receptionist> get copyWith =>
      throw _privateConstructorUsedError;
}

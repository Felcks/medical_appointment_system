// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  Interval get date => throw _privateConstructorUsedError;
  AppointmentType get type => throw _privateConstructorUsedError;
  Patient get patient => throw _privateConstructorUsedError;
  Doctor get doctor => throw _privateConstructorUsedError;
  String get observation => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Receptionist get createdBy => throw _privateConstructorUsedError;
  AppointmentStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {Interval date,
      AppointmentType type,
      Patient patient,
      Doctor doctor,
      String observation,
      DateTime createdAt,
      Receptionist createdBy,
      AppointmentStatus status});

  $IntervalCopyWith<$Res> get date;
  $PatientCopyWith<$Res> get patient;
  $DoctorCopyWith<$Res> get doctor;
  $ReceptionistCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? patient = null,
    Object? doctor = null,
    Object? observation = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Interval,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor,
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as Receptionist,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IntervalCopyWith<$Res> get date {
    return $IntervalCopyWith<$Res>(_value.date, (value) {
      return _then(_value.copyWith(date: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get patient {
    return $PatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DoctorCopyWith<$Res> get doctor {
    return $DoctorCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceptionistCopyWith<$Res> get createdBy {
    return $ReceptionistCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$_AppointmentCopyWith(
          _$_Appointment value, $Res Function(_$_Appointment) then) =
      __$$_AppointmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Interval date,
      AppointmentType type,
      Patient patient,
      Doctor doctor,
      String observation,
      DateTime createdAt,
      Receptionist createdBy,
      AppointmentStatus status});

  @override
  $IntervalCopyWith<$Res> get date;
  @override
  $PatientCopyWith<$Res> get patient;
  @override
  $DoctorCopyWith<$Res> get doctor;
  @override
  $ReceptionistCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$_AppointmentCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$_Appointment>
    implements _$$_AppointmentCopyWith<$Res> {
  __$$_AppointmentCopyWithImpl(
      _$_Appointment _value, $Res Function(_$_Appointment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? patient = null,
    Object? doctor = null,
    Object? observation = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? status = null,
  }) {
    return _then(_$_Appointment(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Interval,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor,
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as Receptionist,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Appointment extends _Appointment with DiagnosticableTreeMixin {
  const _$_Appointment(
      {required this.date,
      required this.type,
      required this.patient,
      required this.doctor,
      required this.observation,
      required this.createdAt,
      required this.createdBy,
      required this.status})
      : super._();

  factory _$_Appointment.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentFromJson(json);

  @override
  final Interval date;
  @override
  final AppointmentType type;
  @override
  final Patient patient;
  @override
  final Doctor doctor;
  @override
  final String observation;
  @override
  final DateTime createdAt;
  @override
  final Receptionist createdBy;
  @override
  final AppointmentStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Appointment(date: $date, type: $type, patient: $patient, doctor: $doctor, observation: $observation, createdAt: $createdAt, createdBy: $createdBy, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Appointment'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('doctor', doctor))
      ..add(DiagnosticsProperty('observation', observation))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Appointment &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.observation, observation) ||
                other.observation == observation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, type, patient, doctor,
      observation, createdAt, createdBy, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentCopyWith<_$_Appointment> get copyWith =>
      __$$_AppointmentCopyWithImpl<_$_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentToJson(
      this,
    );
  }
}

abstract class _Appointment extends Appointment {
  const factory _Appointment(
      {required final Interval date,
      required final AppointmentType type,
      required final Patient patient,
      required final Doctor doctor,
      required final String observation,
      required final DateTime createdAt,
      required final Receptionist createdBy,
      required final AppointmentStatus status}) = _$_Appointment;
  const _Appointment._() : super._();

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$_Appointment.fromJson;

  @override
  Interval get date;
  @override
  AppointmentType get type;
  @override
  Patient get patient;
  @override
  Doctor get doctor;
  @override
  String get observation;
  @override
  DateTime get createdAt;
  @override
  Receptionist get createdBy;
  @override
  AppointmentStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentCopyWith<_$_Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

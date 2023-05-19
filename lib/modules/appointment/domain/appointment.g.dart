// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      date: Interval.fromJson(json['date'] as Map<String, dynamic>),
      type: $enumDecode(_$AppointmentTypeEnumMap, json['type']),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      observation: json['observation'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy:
          Receptionist.fromJson(json['createdBy'] as Map<String, dynamic>),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type': _$AppointmentTypeEnumMap[instance.type]!,
      'patient': instance.patient,
      'doctor': instance.doctor,
      'observation': instance.observation,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
    };

const _$AppointmentTypeEnumMap = {
  AppointmentType.MAINTENANCE: 'MAINTENANCE',
  AppointmentType.AVALATION: 'AVALATION',
  AppointmentType.NEW_CLIENT: 'NEW_CLIENT',
  AppointmentType.OTHER: 'OTHER',
};

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.SCHEDULED: 'SCHEDULED',
  AppointmentStatus.PATIENT_READY: 'PATIENT_READY',
  AppointmentStatus.IN_PROGRESS: 'IN_PROGRESS',
  AppointmentStatus.DONE: 'DONE',
};

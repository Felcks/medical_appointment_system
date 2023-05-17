// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      medicalPlan: json['medicalPlan'] as String,
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate.toIso8601String(),
      'medicalPlan': instance.medicalPlan,
    };

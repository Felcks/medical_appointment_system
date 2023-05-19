// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate.toIso8601String(),
    };

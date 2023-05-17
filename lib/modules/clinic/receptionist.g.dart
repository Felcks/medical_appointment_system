// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receptionist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Receptionist _$$_ReceptionistFromJson(Map<String, dynamic> json) =>
    _$_Receptionist(
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$_ReceptionistToJson(_$_Receptionist instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate.toIso8601String(),
    };

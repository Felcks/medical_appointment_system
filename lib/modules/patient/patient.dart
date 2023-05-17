import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient  with _$Patient {
  const factory Patient({
    required String name,
    required DateTime birthDate,
    required String medicalPlan,
  }) = _Patient;

  factory Patient.fromJson(Map<String, Object?> json)
  => _$PatientFromJson(json);
}
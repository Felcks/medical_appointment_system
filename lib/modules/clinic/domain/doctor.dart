import 'package:medical_appointment_system/modules/clinic/domain/availability.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required String name,
    required DateTime birthDate,
   // required List<Availability> weekAvailability,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, Object?> json)
  => _$DoctorFromJson(json);
}
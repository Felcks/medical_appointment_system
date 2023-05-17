import 'package:medical_appointment_system/modules/appointment/appointment_running.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_status.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_type.dart';
import 'package:medical_appointment_system/modules/clinic/receptionist.dart';
import 'package:medical_appointment_system/modules/patient/patient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../clinic/doctor.dart';
import '../utils/interval.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required Interval date,
    required AppointmentType type,
    required Patient patient,
    required Doctor doctor,
    required String observation,
    required DateTime createdAt,
    required Receptionist createdBy,
    required AppointmentStatus status,
  }) = _Appointment;

  const Appointment._();

  factory Appointment.fromJson(Map<String, Object?> json)
  => _$AppointmentFromJson(json);

  AppointmentRunning getBoardStatus(DateTime currentTime) {
    AppointmentRunning result = AppointmentRunning.ON_SCHEDULE;
    switch(status) {
      case AppointmentStatus.SCHEDULED: {
        Duration distanceToNextMark = date.start.difference(currentTime);
        result = getRunningStatusBasedOnDistanceToNextMark(distanceToNextMark, 30);
      }
      case AppointmentStatus.PATIENT_READY: {
        Duration distanceToNextMark = date.start.difference(currentTime);
        result = getRunningStatusBasedOnDistanceToNextMark(distanceToNextMark, 5);
      }
      case AppointmentStatus.IN_PROGRESS: {
        Duration distanceToNextMark = date.end.difference(currentTime);
        result = getRunningStatusBasedOnDistanceToNextMark(distanceToNextMark, 5);
      }
      default: { result = AppointmentRunning.ON_SCHEDULE; }
    };

    return result;
  }

  AppointmentRunning getRunningStatusBasedOnDistanceToNextMark(Duration distance, int toleranceInMinutes) {
    if(distance.isNegative || distance.inSeconds == 0) {
      return AppointmentRunning.BEHIND_SCHEDULE;
    }

    if(distance.inMinutes <= toleranceInMinutes) {
      return AppointmentRunning.ALMOST_BEHIND_SCHEDULE;
    }

    return AppointmentRunning.ON_SCHEDULE;
  }
}
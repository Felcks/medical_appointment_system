import 'package:medical_appointment_system/modules/appointment/domain/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/domain/appointment_result.dart';

class AppointmentRealization {
  Appointment appointment;
  AppointmentResult result;
  String notes;

  AppointmentRealization(this.appointment, this.result, this.notes);
}
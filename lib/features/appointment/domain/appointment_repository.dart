import 'package:medical_appointment_system/modules/appointment/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_status.dart';
import 'package:medical_appointment_system/modules/clinic/doctor.dart';
import 'package:medical_appointment_system/modules/clinic/receptionist.dart';
import 'package:medical_appointment_system/modules/patient/patient.dart';

import '../../../modules/appointment/appointment_type.dart';
import '../../../modules/utils/interval.dart';

class AppointmentRepository {
  final List<Appointment> _appointments = List.empty(growable: true);

  AppointmentRepository() {
    Interval interval = Interval(start:DateTime(2000, DateTime.january, 20, 9, 0), end:DateTime(2000, DateTime.january, 20, 9, 30));
    AppointmentType appointmentType = AppointmentType.MAINTENANCE;
    Patient patient = Patient(name: "José Alves", birthDate: DateTime.now(), medicalPlan: "Sul América");
    Doctor doctor = Doctor(name: "Felipe Almeida", birthDate: DateTime.now());
    String observation = "observation";
    Receptionist receptionist = Receptionist(name: "Regina", birthDate: DateTime.now());
    Appointment appointment = Appointment(
      date: interval,
      type: appointmentType,
      patient: patient,
      doctor: doctor,
      observation: observation,
      createdAt: DateTime.now(),
      createdBy: receptionist,
      status: AppointmentStatus.SCHEDULED,
    );

    _appointments.add(appointment);
  }

  List<Appointment> getAppointments() {
    return _appointments;
  }
}

import 'package:medical_appointment_system/modules/appointment/domain/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/domain/appointment_status.dart';
import 'package:medical_appointment_system/modules/clinic/doctor.dart';
import 'package:medical_appointment_system/modules/clinic/receptionist.dart';
import 'package:medical_appointment_system/modules/patient/patient.dart';

import '../../../modules/appointment/domain/appointment_type.dart';
import '../../../modules/utils/interval.dart';

class AppointmentRepository {
  final List<Appointment> _appointments = List.empty(growable: true);

  AppointmentRepository() {
    Interval interval = Interval(
        start: DateTime.now().copyWith(hour: 9, minute: 0),
        end: DateTime.now().copyWith(hour: 9, minute: 30));
    AppointmentType appointmentType = AppointmentType.MAINTENANCE;
    Patient patient = Patient(
        name: "José Alves",
        birthDate: DateTime.now(),
        medicalPlan: "Sul América");
    Doctor doctor = Doctor(name: "Felipe Almeida", birthDate: DateTime.now());
    String observation = "observation";
    Receptionist receptionist =
        Receptionist(name: "Regina", birthDate: DateTime.now());
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
    _appointments.add(
      appointment.copyWith(
        date: interval.copyWith(
            start: interval.start.add(Duration(days: 1, minutes: 30)),
            end: interval.end.add(Duration(days: 1, minutes: 30))),
        patient: patient.copyWith(name: "Matheus Felipe"),
        type: AppointmentType.AVALATION
      ),
    );
  }

  List<Appointment> getAppointments() {
    return _appointments;
  }

  List<Appointment> getAppointmentsAtDate(DateTime date) {
    return _appointments
        .where((element) => element.date.isInTheSameDay(date))
        .toList();
  }

  void changeAppointmentStatus(Appointment appointment, AppointmentStatus status) {
    int index = _appointments.indexOf(appointment);
    _appointments[index] = appointment.copyWith(status: status);
  }
}

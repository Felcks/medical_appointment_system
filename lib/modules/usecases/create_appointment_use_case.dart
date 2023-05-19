import 'package:medical_appointment_system/modules/appointment/domain/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_status.dart';
import 'package:medical_appointment_system/modules/appointment/domain/appointment_type.dart';
import 'package:medical_appointment_system/modules/clinic/doctor.dart';
import 'package:medical_appointment_system/modules/clinic/receptionist.dart';
import 'package:medical_appointment_system/modules/patient/patient.dart';
import 'package:medical_appointment_system/modules/usecases/get_current_time_use_case.dart';

abstract class CreateAppointmentUseCase {
  Appointment invoke(DateTime beginAt, AppointmentType appointmentType, Patient patient,
      Doctor doctor, String observation, Receptionist createdBy);
}

class CreateAppointmentUseCaseImpl extends CreateAppointmentUseCase {
  GetCurrentTimeUseCase getCurrentTimeUseCase;

  CreateAppointmentUseCaseImpl({required this.getCurrentTimeUseCase});

  @override
  Appointment invoke(DateTime beginAt, AppointmentType appointmentType, Patient patient,
      Doctor doctor, String observation, Receptionist createdBy) {
    return Appointment(
      beginAt: beginAt,
      type: appointmentType,
      patient: patient,
      doctor: doctor,
      observation: observation,
      createdAt: getCurrentTimeUseCase.invoke(),
      createdBy: createdBy,
      status: AppointmentStatus.SCHEDULED,
    );
  }
}

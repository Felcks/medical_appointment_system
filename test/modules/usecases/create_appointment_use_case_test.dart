import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:medical_appointment_system/modules/appointment/domain/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/domain/appointment_type.dart';
import 'package:medical_appointment_system/modules/clinic/doctor.dart';
import 'package:medical_appointment_system/modules/clinic/receptionist.dart';
import 'package:medical_appointment_system/modules/patient/patient.dart';
import 'package:medical_appointment_system/modules/usecases/create_appointment_use_case.dart';
import 'package:medical_appointment_system/modules/usecases/get_current_time_use_case.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_appointment_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Patient>(), MockSpec<Doctor>(), MockSpec<Receptionist>()])
void main() {

  late GetCurrentTimeUseCase mockGetCurrentTimeUseCase;
  late CreateAppointmentUseCase sut;

  setUp(() {
    mockGetCurrentTimeUseCase = GetCurrentTimeUseCase();
    sut = CreateAppointmentUseCaseImpl(getCurrentTimeUseCase: mockGetCurrentTimeUseCase);
  });

  test('given parameters, when create appoint, than create a correct appointment', () {
    DateTime beginAt = DateTime(2000, DateTime.january, 20);
    AppointmentType appointmentType = AppointmentType.MAINTENANCE;
    Patient patient = MockPatient();
    Doctor doctor = MockDoctor();
    String observation = "observation";
    Receptionist receptionist = MockReceptionist();
    Appointment expected = Appointment(beginAt: beginAt, type: appointmentType, patient: patient, doctor: doctor, observation: observation, createdAt: mockGetCurrentTimeUseCase.invoke(), createdBy: receptionist);

    Appointment result = sut.invoke(beginAt, appointmentType, patient, doctor, observation, receptionist);

    expect(result, expected);

  });
}
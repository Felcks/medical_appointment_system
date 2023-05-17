import 'package:medical_appointment_system/modules/clinic/receptionist.dart';

import 'doctor.dart';

class Staff {
  final List<Doctor> doctors;
  final List<Receptionist> receptionists;

  Staff(this.doctors, this.receptionists);
}
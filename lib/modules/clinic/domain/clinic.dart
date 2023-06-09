import 'package:medical_appointment_system/modules/clinic/domain/staff.dart';
import 'package:medical_appointment_system/modules/clinic/domain/week_schedule.dart';

class Clinic {
  final String name;
  final WeekSchedule weekSchedule;
  final Staff staff;

  Clinic(this.name, this.weekSchedule, this.staff);
}
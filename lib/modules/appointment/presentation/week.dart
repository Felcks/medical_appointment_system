import 'package:medical_appointment_system/modules/clinic/domain/week_schedule.dart';

class Week {
  int selectedDay;
  WeekSchedule weekSchedule;

  Week({required this.selectedDay, required this.weekSchedule});
}
import 'package:medical_appointment_system/modules/clinic/domain/availability.dart';
import 'package:medical_appointment_system/modules/clinic/domain/week_schedule.dart';

class GetWeekUseCase {

  WeekSchedule invoke(DateTime date) {
    DateTime now = date;
    List<Availability> availability = List.empty(growable: true);

    DateTime mondayThatWeek = now.subtract(Duration(days: now.weekday - 1));

    for(int i = 0; i < DateTime.daysPerWeek; i++) {
      DateTime day = mondayThatWeek.add(Duration(days: i));
      availability.add(Availability(day.copyWith(hour: 9), day.copyWith(hour: 18)));
    }

    return WeekSchedule(availability);
  }
}
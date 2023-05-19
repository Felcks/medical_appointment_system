import 'package:medical_appointment_system/modules/clinic/domain/availability.dart';

class WeekSchedule {
  final List<Availability> _openHours;

  WeekSchedule(this._openHours);

  Availability getDay(int weekday) {
    return _openHours[weekday];
  }

  int length() => _openHours.length;
}
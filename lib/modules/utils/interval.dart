import 'package:freezed_annotation/freezed_annotation.dart';

part 'interval.freezed.dart';
part 'interval.g.dart';

@freezed
class Interval with _$Interval {
  const factory Interval({
    required DateTime start,
    required DateTime end,
  }) = _Interval;

  factory Interval.fromJson(Map<String, Object?> json)
  => _$IntervalFromJson(json);

  const Interval._();

  Duration getDuration() {
    return end.difference(start);
  }

  bool isInTheSameDay(DateTime date) {
    return start.day == date.day &&
    start.month == date.month &&
    start.year == date.year;
  }
}
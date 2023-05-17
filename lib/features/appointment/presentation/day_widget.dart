import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:medical_appointment_system/features/appointment/presentation/week.dart';

class DayWidget extends StatefulWidget {
  Week week;
  final int currentIndex;
  final VoidCallback onPressed;

  DayWidget({Key? key, required this.week, required this.currentIndex, required this.onPressed}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.week.selectedDay == widget.currentIndex) ? _selectedDay() : _notSelectedDay();
  }

  Widget _notSelectedDay() {
    return SizedBox(
      width: 100,
      height: 50,
      child: Card(
        color: Theme.of(context).cardColor,
        child: TextButton(
          onPressed: () { widget.onPressed.call(); },
          child: Column(
            children: [
              Text(
                DateFormat('EEE').format(widget.week.weekSchedule.getDay(widget.currentIndex).start),
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.week.weekSchedule.getDay(widget.currentIndex).start.day}",
                style: const TextStyle(fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedDay() {
    return SizedBox(
      width: 100,
      height: 50,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: TextButton(
          onPressed: () {
            setState(() {
              widget.week = Week(selectedDay: widget.currentIndex, weekSchedule: widget.week.weekSchedule);
            });
          },
          child: Column(
            children: [
              Text(
                DateFormat('EEE').format(widget.week.weekSchedule.getDay(widget.currentIndex).start),
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.week.weekSchedule.getDay(widget.currentIndex).start.day}",
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }
}

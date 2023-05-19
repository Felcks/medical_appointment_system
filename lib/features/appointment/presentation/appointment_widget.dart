import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:medical_appointment_system/modules/appointment/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_running.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_type.dart';

class AppointmentWidget extends StatefulWidget {
  final Appointment appointment;

  const AppointmentWidget({Key? key, required this.appointment}) : super(key: key);

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    Appointment appointment = widget.appointment;

    AppointmentRunning runningStatus =
        appointment.getBoardStatus(DateTime(2000, DateTime.january, 20, 9, 0));


    return Card(
      color: (runningStatus == AppointmentRunning.ON_SCHEDULE)
          ? Colors.white
          : (runningStatus == AppointmentRunning.ALMOST_BEHIND_SCHEDULE)
              ? Colors.yellow
              : Colors.red,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(children: [
          _appointmentIcon(appointment.type),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${DateFormat('hh:mm').format(appointment.date.start)}h - ${DateFormat('hh:mm').format(appointment.date.end)}h (${appointment.date.getDuration().inMinutes} minutos)",
                style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.secondary),
              ),
              Text(
                appointment.patient.name,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text("Dr. ${appointment.doctor.name}"),
            ],
          )
        ]),
      ),
    );
  }

  //https://www.flaticon.com/packs/medical-concepts
  Widget _appointmentIcon(AppointmentType type) {
    Widget result;
    switch (type) {
      case AppointmentType.MAINTENANCE:
        {
          result = Image.asset(
            "assets/dental_checkup.png",
            width: 32,
            height: 32,
          );
        }
      case AppointmentType.AVALATION:
        {
          result = Image.asset(
            "assets/avaliation.png",
            width: 32,
            height: 32,
          );
        }
      case AppointmentType.NEW_CLIENT:
        {
          result = Image.asset(
            "assets/avaliation.png",
            width: 32,
            height: 32,
          );
        }
      case AppointmentType.OTHER:
        {
          result = Image.asset(
            "assets/avaliation.png",
            width: 32,
            height: 32,
          );
        }
    }

    return result;
  }
}

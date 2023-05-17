import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_appointment_system/modules/appointment/appointment.dart';

import 'appointment_widget.dart';

// class AppointmentBoardWidget extends StatelessWidget {
//
//   final String title;
//
//   const AppointmentBoardWidget({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     );
//   }
// }

class AppointmentBoardWidget extends StatefulWidget {
  final String title;
  final List<Appointment> appointments;

  const AppointmentBoardWidget({Key? key, required this.title, required this.appointments})
      : super(key: key);

  @override
  State<AppointmentBoardWidget> createState() => _AppointmentBoardWidgetState();
}

class _AppointmentBoardWidgetState extends State<AppointmentBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: widget.appointments.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return Draggable(
                  data: widget.appointments[index],
                  childWhenDragging: SizedBox(),
                  feedback: AppointmentWidget(appointment: widget.appointments[index]),
                  child: AppointmentWidget(appointment: widget.appointments[index]),
                  onDragEnd: (details) {
                    if (details.wasAccepted) {
                      setState(() {
                        widget.appointments.removeAt(index);
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

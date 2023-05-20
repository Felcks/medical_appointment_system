import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../features/appointment/domain/appointment_repository.dart';
import '../widgets/appointment_board_widget.dart';
import '../widgets/day_widget.dart';
import '../week.dart';
import '../../../usecases/get_week_use_case.dart';
import '../../domain/appointment.dart';
import '../../domain/appointment_status.dart';

class AppointmentPage extends StatefulWidget {
  final String title;

  const AppointmentPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int _selectedIndex = 0;
  AppointmentRepository appointmentRepository = AppointmentRepository();
  GetWeekUseCase getWeekUseCase = GetWeekUseCase();
  Week week = Week(
      selectedDay: DateTime.now().weekday - 1,
      weekSchedule: GetWeekUseCase().invoke(DateTime.now()));
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<Appointment> allAppointments = List.of(
        appointmentRepository.getAppointmentsAtDate(selectedDate),
        growable: true);
    List<Appointment> scheduled = allAppointments
        .where((element) => element.status == AppointmentStatus.SCHEDULED)
        .toList();
    List<Appointment> patientReady = allAppointments
        .where((element) => element.status == AppointmentStatus.PATIENT_READY)
        .toList();
    List<Appointment> inProgress = allAppointments
        .where((element) => element.status == AppointmentStatus.IN_PROGRESS)
        .toList();
    List<Appointment> done = allAppointments
        .where((element) => element.status == AppointmentStatus.DONE)
        .toList();

    return Scaffold(
      bottomNavigationBar: (MediaQuery.of(context).size.width < 640)
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigoAccent,
              // called when one tab is selected
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              // bottom tab items
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Consultas'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.local_hospital), label: 'Clínica'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_pin_rounded),
                    label: "Doutores",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Pacientes")
                ])
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (MediaQuery.of(context).size.width >= 640)
              NavigationRail(
                labelType: NavigationRailLabelType.all,
                groupAlignment: 0,
                elevation: 10,
                minExtendedWidth: 300,
                minWidth: 100,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                    if (index == 0)
                      Modular.to.pushNamed('/');
                    else
                      Modular.to.pushNamed('/clinic');
                  });
                },
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("Consultas")),
                  NavigationRailDestination(
                      icon: Icon(Icons.local_hospital), label: Text("Clínica")),
                  NavigationRailDestination(
                      icon: Icon(Icons.person_pin_rounded),
                      label: Text("Doutores")),
                  NavigationRailDestination(
                      icon: Icon(Icons.person), label: Text("Pacientes")),
                ],
              ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Bem vindo, Rafaela",
                      style:
                          TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: ListView.builder(
                        itemCount: week.weekSchedule.length(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: DayWidget(
                              week: week,
                              currentIndex: index,
                              onPressed: () {
                                setState(
                                  () {
                                    week = Week(
                                        selectedDay: index,
                                        weekSchedule: week.weekSchedule);
                                    selectedDate =
                                        week.weekSchedule.getDay(index).start;
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //(MediaQuery.of(context).size.width / View.of(context).devicePixelRatio >= 640)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: (MediaQuery.of(context).size.width /
                                  View.of(context).devicePixelRatio >=
                              640)
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _boardLayout(
                                  scheduled, patientReady, inProgress, done))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _boardLayout(
                                  scheduled, patientReady, inProgress, done),
                            ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: SizedBox(
                      //     height: 400,
                      //     width: 1000,
                      //     child: Table(children: [
                      //       TableRow(children: [
                      //         DragTarget<Appointment>(
                      //           builder: (context, candidateItems, rejectedItems) {
                      //             return SizedBox(
                      //               height: 500,
                      //               child: AppointmentBoardWidget(
                      //                 title: "Agendada",
                      //                 appointments: scheduled,
                      //               ),
                      //             );
                      //           },
                      //           onAccept: (item) {
                      //             setState(() {
                      //               appointmentRepository.changeAppointmentStatus(
                      //                   item, AppointmentStatus.SCHEDULED);
                      //             });
                      //           },
                      //         ),
                      //         TableCell(
                      //           verticalAlignment: TableCellVerticalAlignment.fill,
                      //           child: DragTarget<Appointment>(
                      //             builder: (context, candidateItems, rejectedItems) {
                      //               return AppointmentBoardWidget(
                      //                 title: "Paciente Pronto",
                      //                 appointments: patientReady,
                      //               );
                      //             },
                      //             onAccept: (item) {
                      //               setState(() {
                      //                 appointmentRepository.changeAppointmentStatus(
                      //                     item, AppointmentStatus.PATIENT_READY);
                      //               });
                      //               //patientReady.add(item.copyWith(status: AppointmentStatus.PATIENT_READY));
                      //             },
                      //           ),
                      //         ),
                      //         TableCell(
                      //           verticalAlignment: TableCellVerticalAlignment.fill,
                      //           child: DragTarget<Appointment>(
                      //             builder: (context, candidateItems, rejectedItems) {
                      //               return AppointmentBoardWidget(
                      //                 title: "Em Andamento",
                      //                 appointments: inProgress,
                      //               );
                      //             },
                      //             onAccept: (item) {
                      //               setState(() {
                      //                 appointmentRepository.changeAppointmentStatus(
                      //                     item, AppointmentStatus.IN_PROGRESS);
                      //               });
                      //             },
                      //           ),
                      //         ),
                      //         TableCell(
                      //           verticalAlignment: TableCellVerticalAlignment.fill,
                      //           child: DragTarget<Appointment>(
                      //             builder: (context, candidateItems, rejectedItems) {
                      //               return AppointmentBoardWidget(
                      //                 title: "Concluída",
                      //                 appointments: done,
                      //               );
                      //             },
                      //             onAccept: (item) {
                      //               setState(() {
                      //                 appointmentRepository.changeAppointmentStatus(
                      //                     item, AppointmentStatus.DONE);
                      //               });
                      //             },
                      //           ),
                      //         ),
                      //       ]),
                      //     ]),
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _boardLayout(
      List<Appointment> scheduled,
      List<Appointment> patientReady,
      List<Appointment> inProgress,
      List<Appointment> done) {
    return [
      Expanded(
        child: DragTarget<Appointment>(
          builder: (context, candidateItems, rejectedItems) {
            return AppointmentBoardWidget(
              title: "Agendada",
              appointments: scheduled,
            );
            // return Card(child: Text("oi"),);
          },
          onAccept: (item) {
            setState(() {
              appointmentRepository.changeAppointmentStatus(
                  item, AppointmentStatus.SCHEDULED);
            });
          },
        ),
      ),
      Expanded(
        child: DragTarget<Appointment>(
          builder: (context, candidateItems, rejectedItems) {
            return AppointmentBoardWidget(
              title: "Paciente Pronto",
              appointments: patientReady,
            );
            // return Card(child: Text("oi"),);
          },
          onAccept: (item) {
            setState(() {
              appointmentRepository.changeAppointmentStatus(
                  item, AppointmentStatus.PATIENT_READY);
            });
          },
        ),
      ),
      Expanded(
        child: DragTarget<Appointment>(
          builder: (context, candidateItems, rejectedItems) {
            return AppointmentBoardWidget(
              title: "Em andamento",
              appointments: inProgress,
            );
            // return Card(child: Text("oi"),);
          },
          onAccept: (item) {
            setState(() {
              appointmentRepository.changeAppointmentStatus(
                  item, AppointmentStatus.IN_PROGRESS);
            });
          },
        ),
      ),
      Expanded(
        child: DragTarget<Appointment>(
          builder: (context, candidateItems, rejectedItems) {
            return AppointmentBoardWidget(
              title: "Concluído",
              appointments: done,
            );
            // return Card(child: Text("oi"),);
          },
          onAccept: (item) {
            setState(() {
              appointmentRepository.changeAppointmentStatus(
                  item, AppointmentStatus.DONE);
            });
          },
        ),
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/appointment/domain/appointment_repository.dart';
import '../../../features/appointment/presentation/appointment_board_widget.dart';
import '../../../features/appointment/presentation/day_widget.dart';
import '../../../features/appointment/presentation/week.dart';
import '../../usecases/get_week_use_case.dart';
import '../appointment.dart';
import '../appointment_status.dart';

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
          ])
          : null,
      body: SafeArea(
        child: Row(
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
                    if(index == 0)
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
                      icon: Icon(Icons.person_pin_rounded), label: Text("Doutores")),
                  NavigationRailDestination(
                      icon: Icon(Icons.person), label: Text("Pacientes")),
                ],
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Bem vindo, Rafaela",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  width: 1000,
                  height: 100,
                  child: ListView.builder(
                    itemCount: week.weekSchedule.length(),
                    scrollDirection: Axis.horizontal,
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
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 400,
                    width: 1000,
                    child: Table(children: [
                      TableRow(children: [
                        DragTarget<Appointment>(
                          builder: (context, candidateItems, rejectedItems) {
                            return SizedBox(
                              height: 500,
                              child: AppointmentBoardWidget(
                                title: "Agendada",
                                appointments: scheduled,
                              ),
                            );
                          },
                          onAccept: (item) {
                            setState(() {
                              appointmentRepository.changeAppointmentStatus(
                                  item, AppointmentStatus.SCHEDULED);
                            });
                          },
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: DragTarget<Appointment>(
                            builder: (context, candidateItems, rejectedItems) {
                              return AppointmentBoardWidget(
                                title: "Paciente Pronto",
                                appointments: patientReady,
                              );
                            },
                            onAccept: (item) {
                              setState(() {
                                appointmentRepository.changeAppointmentStatus(
                                    item, AppointmentStatus.PATIENT_READY);
                              });
                              //patientReady.add(item.copyWith(status: AppointmentStatus.PATIENT_READY));
                            },
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: DragTarget<Appointment>(
                            builder: (context, candidateItems, rejectedItems) {
                              return AppointmentBoardWidget(
                                title: "Em Andamento",
                                appointments: inProgress,
                              );
                            },
                            onAccept: (item) {
                              setState(() {
                                appointmentRepository.changeAppointmentStatus(
                                    item, AppointmentStatus.IN_PROGRESS);
                              });
                            },
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: DragTarget<Appointment>(
                            builder: (context, candidateItems, rejectedItems) {
                              return AppointmentBoardWidget(
                                title: "Concluída",
                                appointments: done,
                              );
                            },
                            onAccept: (item) {
                              setState(() {
                                appointmentRepository.changeAppointmentStatus(
                                    item, AppointmentStatus.DONE);
                              });
                            },
                          ),
                        ),
                      ]),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

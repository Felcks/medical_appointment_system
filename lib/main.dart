import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_appointment_system/features/appointment/domain/appointment_repository.dart';
import 'package:medical_appointment_system/features/appointment/presentation/appointment_board_widget.dart';
import 'package:medical_appointment_system/features/appointment/presentation/day_widget.dart';
import 'package:medical_appointment_system/features/appointment/presentation/week.dart';
import 'package:medical_appointment_system/modules/appointment/appointment.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_status.dart';
import 'package:medical_appointment_system/modules/usecases/get_week_use_case.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Appointment System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sistema de Consultas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  AppointmentRepository appointmentRepository = AppointmentRepository();
  GetWeekUseCase getWeekUseCase = GetWeekUseCase();
  Week week = Week(
      selectedDay: DateTime.now().weekday - 1,
      weekSchedule: GetWeekUseCase().invoke(DateTime.now()));
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<Appointment> allAppointments = List.of(appointmentRepository.getAppointmentsAtDate(selectedDate), growable: true);
    List<Appointment> scheduled = allAppointments.where((element) => element.status == AppointmentStatus.SCHEDULED).toList();
    List<Appointment> patientReady = allAppointments.where((element) => element.status == AppointmentStatus.PATIENT_READY).toList();
    List<Appointment> inProgress = allAppointments.where((element) => element.status == AppointmentStatus.IN_PROGRESS).toList();
    List<Appointment> done = allAppointments.where((element) => element.status == AppointmentStatus.DONE).toList();

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
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Consultas'),
                  BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Clínica'),
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
                  });
                },
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text("Consultas")),
                  NavigationRailDestination(
                      icon: Icon(Icons.local_hospital), label: Text("Clínica"))
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
                                week = Week(selectedDay: index, weekSchedule: week.weekSchedule);
                                selectedDate = week.weekSchedule.getDay(index).start;
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
                              appointmentRepository.changeAppointmentStatus(item, AppointmentStatus.SCHEDULED);
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
                                appointmentRepository.changeAppointmentStatus(item, AppointmentStatus.PATIENT_READY);
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
                                appointmentRepository.changeAppointmentStatus(item, AppointmentStatus.IN_PROGRESS);
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
                                appointmentRepository.changeAppointmentStatus(item, AppointmentStatus.DONE);
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medical_appointment_system/modules/appointment/appointment_module.dart';
import 'package:medical_appointment_system/modules/clinic/clinic_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: AppointmentModule(), transition: TransitionType.noTransition),
    ModuleRoute('/clinic', module: ClinicModule(), transition: TransitionType.noTransition),
  ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Medical Appointment System",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

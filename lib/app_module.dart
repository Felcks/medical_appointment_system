import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medical_appointment_system/main.dart';
import 'package:medical_appointment_system/modules/appointment/presentation/appointment_module.dart';
import 'package:medical_appointment_system/modules/clinic/presentation/clinic_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const MyHomePage(title: "Sistema de Consultas")),
    ModuleRoute('/clinic', module: ClinicModule()),
    ModuleRoute('/appointment', module: AppointmentModule()),
    // ModuleRoute('/', module: AppointmentModule());
  ];
}

class AppWindget extends StatelessWidget {
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

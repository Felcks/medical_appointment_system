import 'package:flutter_modular/flutter_modular.dart';

import 'appointment_page.dart';

class AppointmentModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AppointmentPage(title: 'Page')),
      ];
}

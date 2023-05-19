
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/clinic_page.dart';

class ClinicModule extends Module {

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ClinicPage(title: "Clinica",))
  ];
}
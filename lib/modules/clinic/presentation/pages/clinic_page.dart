import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClinicPage extends StatefulWidget {
  final String title;

  const ClinicPage({Key? key, required this.title}) : super(key: key);

  @override
  State<ClinicPage> createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: Column(
                          children: [
                            Text("Funcionários")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Card(
                              child: Column(
                                children: [
                                  Text("Configurações")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Expanded(
                            flex: 6,
                            child: Card(
                              child: Column(
                                children: [
                                  Text("Horários")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

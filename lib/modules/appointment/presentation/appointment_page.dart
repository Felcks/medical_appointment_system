import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppointmentPage extends StatefulWidget {
  
  final String title;
  
  const AppointmentPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Consultas"));
  }
}

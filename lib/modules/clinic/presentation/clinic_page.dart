import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClinicPage extends StatefulWidget {
  final String title;

  const ClinicPage({Key? key, required this.title}) : super(key: key);

  @override
  State<ClinicPage> createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("CLINIC"),
    );
  }
}

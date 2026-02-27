import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/nev_screens/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(children: [HeaderWidget()])),
    );
  }
}

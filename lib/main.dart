import 'package:flutter/material.dart';
import 'screens/inicio.dart';

void main() => runApp(const UMind());

class UMind extends StatelessWidget {
  const UMind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          accentColor: const Color.fromARGB(255, 154, 208, 194),
        ),
      ),
      home: const Inicio(),
    );
  }
}

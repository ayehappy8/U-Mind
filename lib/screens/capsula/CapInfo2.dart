import 'package:flutter/material.dart';
import 'package:umind/screens/capsulas.dart';

class CapInfo2 extends StatelessWidget {
  const CapInfo2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 180,
                    height: 380,
                    child: Text(
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        " ¿Qué es la autoconciencia?\n\n La autoconciencia es la capacidad de reconocer y comprender tus propias emociones, pensamientos, comportamientos, fortalezas y debilidades, implica tener una compresión mas profunda de ti mismo, incluyendo tus valores, creencias y motivaciones. La autoconciencia es un componente fundamental de la inteligencia emocional y juega un papel crucial en el desarrollo personal y la toma de decisiones. Existen dos tipos principales de autoconciencia: \n\t 1) Conciencia emocional. \n\t 2) Conciencia personal. "),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 220, 0, 0),
                        minimumSize: const Size(146, 45),
                      ),
                      onPressed: () {
                        // Acción al presionar el botón
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Capsulas()),
                          (Route<dynamic> route) =>
                              false, // No permite volver a ninguna pantalla anterior
                        );
                      },
                      child: const Text(
                        'Volver',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

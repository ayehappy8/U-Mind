import 'package:flutter/material.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                      width: 320,
                      child: Text("Configuracion", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 23, 56, 84)
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 38, 80, 115),
                        minimumSize: const Size(294, 50),
                      ),
                      child: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 244, 214),
                              fontSize: 20),
                          "Repetir Tutorial",
                          textAlign: TextAlign.center),
                      onPressed: () => {},
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 38, 80, 115),
                        minimumSize: const Size(294, 50),
                      ),
                      child: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 244, 214),
                              fontSize: 20),
                          "Cambiar Paleta de Colores",
                          textAlign: TextAlign.center),
                      onPressed: () => {},
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 38, 80, 115),
                        minimumSize: const Size(294, 50),
                      ),
                      child: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 244, 214),
                              fontSize: 20),
                          "Personalizar Asistente",
                          textAlign: TextAlign.center),
                      onPressed: () => {},
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 179, 19, 18),
                        minimumSize: const Size(294, 50),
                      ),
                      child: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 244, 214),
                              fontSize: 20),
                          "Volver"),
                      onPressed: () => {
                        Navigator.pop(context)
                      },
                    ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
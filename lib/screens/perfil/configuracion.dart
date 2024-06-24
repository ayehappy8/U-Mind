import 'package:flutter/material.dart';
import 'package:umind/screens/perfil/configuracion/paletaColores.dart';
import 'package:umind/screens/perfil/configuracion/persoAsistente.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40, top: 50),
                  height: 180,
                  width: 450,
                  child: Image.asset('assets/Logo2.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: 320,
                  child: const Text(
                    "Configuración",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 23, 56, 84)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 80, 115),
                      minimumSize: const Size(294, 50),
                    ),
                    child: const Text(
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 244, 214),
                            fontSize: 20),
                        "Repetir tutorial",
                        textAlign: TextAlign.center),
                    onPressed: () => {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 80, 115),
                      minimumSize: const Size(294, 50),
                    ),
                    child: const Text(
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 244, 214),
                            fontSize: 20),
                        "Cambiar paleta de colores",
                        textAlign: TextAlign.center),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaletaColores()))
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 80, 115),
                      minimumSize: const Size(294, 50),
                    ),
                    child: const Text(
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 244, 214),
                            fontSize: 20),
                        "Personalizar asistente",
                        textAlign: TextAlign.center),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersoAsistente()))
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 179, 19, 18),
                      minimumSize: const Size(294, 50),
                    ),
                    child: const Text(
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 244, 214),
                            fontSize: 20),
                        "Volver"),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaletaColores extends StatelessWidget {
  const PaletaColores({super.key});

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
                margin: const EdgeInsets.only(bottom: 50, top: 50),
                height: 180,
                width: 450,
                child: Image.asset(
                  'assets/Logo2.png'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 100.0),
                width: 320,
                child: const Text("Cambiar paleta de colores", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 23, 56, 84)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 120.0),
                width: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 45, 149, 150),
                          minimumSize: const Size(50, 50),
                        ),
                        child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 244, 214),
                                fontSize: 20),
                            "Clásico",
                            textAlign: TextAlign.center),
                        onPressed: () => {},
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 219, 192, 95),
                          minimumSize: const Size(50, 50),
                        ),
                        child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 244, 214),
                                fontSize: 20),
                            "Cálido",
                            textAlign: TextAlign.center),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 179, 19, 18),
                    minimumSize: const Size(240, 50),
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
              ),
            ]
          ),
        ),
      ),
    );
  }
}
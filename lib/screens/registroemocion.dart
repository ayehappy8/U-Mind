import 'package:flutter/material.dart';
import 'package:umind/screens/registrocuadro.dart';

class Registroemocion extends StatelessWidget {
  const Registroemocion({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de nombres para los botones
  final List<String> buttonNames = [
    'Felicidad',
    'Tristeza',
    'Ira',
    'Miedo',
    'Asco',
    'Sorpresa',
  ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("¿Qué sientes hoy?", style: TextStyle(fontSize: 25)),

                SizedBox(
                  height: 300.0,
                  width: 350.0,
                  child: Image.asset('assets/mascota.png'),
                ),

                SizedBox(
                  height: 400.0,
                  width: 350.0,
                  child: GridView.count(
                    crossAxisCount: 2, // Establece 2 columnas
                    mainAxisSpacing: 4.0, // Espacio vertical entre los elementos
                    crossAxisSpacing: 4.0, // Espacio horizontal entre los elementos
                    childAspectRatio: 3 / 2, // Ajusta la proporción de los elementos
                    physics: const NeverScrollableScrollPhysics(), // Esto deshabilita el desplazamiento del GridView
                    children: List.generate(buttonNames.length, (index) {
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: const Size(146, 45),
                          ),
                          onPressed: () {
                            // Acción al presionar el botón
                            Navigator.push(
                              context,
                              
                              MaterialPageRoute(builder: (context) => Registrocuadro()),
                            );
                          },
                          child: Text(
                            buttonNames[index],
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

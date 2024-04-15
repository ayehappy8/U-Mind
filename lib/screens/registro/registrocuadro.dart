import 'package:flutter/material.dart';
import 'package:umind/screens/inicio.dart';

class Registrocuadro extends StatelessWidget {
  const Registrocuadro({super.key});

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
                const Text("Profundiza tu emoción", style: TextStyle(fontSize: 25)),

                SizedBox(
                  height: 300.0,
                  width: 350.0,
                  child: Image.asset('assets/mascota.png'),
                ),

                SizedBox(
                  height: 283.0,
                  width: 303.0,                    
                  
                    
                  child: TextField(
                    maxLines: 9,
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFECF4D6),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0), // Define el radio del borde
                      ),
                      hintText: '....',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 250), // Ajusta este valor para mover el botón más al centro
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: const Size(146, 45),
                      ),
                      onPressed: () {
                        // Acción al presionar el botón
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Inicio()),
                        );
                      },
                      child: const Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
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

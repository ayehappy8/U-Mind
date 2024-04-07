import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 250,
                      child: Text(
                        'Joan Pozo', 
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 23, 56, 84))
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: Image.asset('assets/mascota.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'Última Consulta',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 23, 56, 84)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

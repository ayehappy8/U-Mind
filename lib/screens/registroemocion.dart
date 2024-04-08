import 'package:flutter/material.dart';

class Registroemocion extends StatelessWidget {
  const Registroemocion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column (
                children: [
                  Text('Como te sientes hoy?'),

                  SizedBox(
                    height: 300.0,
                    width: 350.0,
                    child: Image.asset('assets/mascota.png'),
                  ),

                  const Row(
                    children: [
                      Text('ola'),Text('ola'),
                    ],
                  ),

                  const Row(
                    children: [
                      Text('ola'),Text('ola'),
                    ],
                  ),

                  const Row(
                    children: [
                      Text('ola'),Text('ola'),
                    ],
                  ),                
                  
                ],  
              )
            ),
          ),
        ),
      ),
    );
  }
}

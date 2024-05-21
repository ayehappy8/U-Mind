import 'package:flutter/material.dart';
import 'package:umind/screens/capsulas.dart';

class test extends StatelessWidget {
  const test({super.key});
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
                  SizedBox(
                    height: 300.0,
                    width: 350.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  const SizedBox(
                    width: 180,
                    height: 100,
                    child: Text(
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        " LO SENTIMOS, EL TEST NO ESTA DISPONIBLE, ESTAMOS TRABJANDO PARA SOLUCIONARLO "),
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

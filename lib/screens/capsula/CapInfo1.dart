import 'package:flutter/material.dart';
import 'package:umind/screens/capsulas.dart';

class CapInfo1 extends StatelessWidget {
  const CapInfo1({super.key});
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
                        " ¿Como dejar de Procrastinar?\n\n!La procrastinación es algo común, pero la estrategia que puedes implementar para reducirla¡ aquí hay unos consejos para dejar de procrastinar.\n\n\t a) Divide en tareas más pequeñas: Descompón tareas grandes en partes más pequeñas y manejables. Esto hace que la tarea parezca menos abrumadora y más fácil de abordar.\n\t b) Establece metas claras: Define metas específicas y alcanzables. Tener objetivos claros te dará un sentido de proposito y facilitará el seguimiento de tu progreso. "),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 220, 0, 0),
                        minimumSize: const Size(146, 45),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Capsulas()),
                          (Route<dynamic> route) => false,
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

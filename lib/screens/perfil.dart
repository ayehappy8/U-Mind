import 'package:flutter/material.dart';
import 'package:umind/screens/login.dart';
import 'package:umind/screens/perfil/consultas.dart';
import 'package:umind/screens/perfil/configuracion.dart';
import 'package:pelaicons/pelaicons.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umind/usuario_auth/firebase_auth_service/getUsuario.dart';
import 'package:umind/functions/getInfoAsistente.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

final List<Map<String, dynamic>> _datosConsulta = <Map<String, dynamic>>[];
final List<Map<String, dynamic>> _datosPerfil = <Map<String, dynamic>>[];

final List<Map<String, dynamic>> _datosAsistente = <Map<String, dynamic>>[];
bool _isLoading = true;

class _PerfilState extends State<Perfil> {
  Future<void> fetchInfoAsistente() async {
    _datosAsistente.clear();
    List<Map<String, dynamic>> datos = await getInfoAsistente();
    setState(() {
      _datosAsistente.addAll(datos);

      _isLoading = false;
    });
  }

  void getInfoPerfil() async {
    _datosPerfil.clear();
    DocumentSnapshot usuarioDatos = await FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(getCurrentUserId())
        .get();
    if (usuarioDatos.exists) {
      _datosPerfil.add(usuarioDatos.data() as Map<String, dynamic>);
    }
    setState(() {});
  }

  void getInfoConsultas() async {
    _datosConsulta.clear();
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(getCurrentUserId());
    QuerySnapshot consultas =
        await documentReference.collection("Consultas").get();

    if (consultas.docs.isNotEmpty) {
      for (var doc in consultas.docs) {
        _datosConsulta.add(doc.data() as Map<String, dynamic>);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchInfoAsistente();
    getInfoConsultas();
    getInfoPerfil();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    if (_datosConsulta.isEmpty || _datosPerfil.isEmpty || _isLoading) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      _datosConsulta.sort((a, b) {
        final DateTime fechaA = (a['fecha'] as Timestamp).toDate();
        final DateTime fechaB = (b['fecha'] as Timestamp).toDate();
        return fechaB.compareTo(fechaA);
      });

      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      width: 180,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Color.fromARGB(255, 23, 56, 84),
                            fontSize: 24,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    '${_datosPerfil[0]['nombre']}\n${_datosPerfil[0]['rut']}'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: SizedBox(
                        height: 80.0,
                        child: Image.asset(
                            'assets/asistentes/${_datosAsistente[0]['mascota']}.png'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 320,
                  child: Text(
                    'Última consulta',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 23, 56, 84)),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 244,
                            214), // Cambia el color de fondo del Container (y, por lo tanto, del SizedBox)
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: Colors
                                .black) // Ajusta el radio de borde según tus preferencias
                        ),
                    width: 320,
                    height: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 23, 56, 84),
                                    fontSize: 24,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${_datosConsulta[0]['asunto']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 23, 56, 84),
                                    fontSize: 18,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${_datosConsulta[0]['detalle']}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 38, 80, 115),
                        minimumSize: const Size(140, 70),
                      ),
                      child: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 244, 214),
                              fontSize: 20),
                          "Ver\nconsultas",
                          textAlign: TextAlign.center),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Consultas()))
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 253, 238, 220),
                        minimumSize: const Size(70, 70),
                      ),
                      child: const Icon(
                        Pelaicons.settings_light_outline,
                        size: 50,
                        weight: 50,
                      ),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Configuracion()))
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 179, 19, 18),
                        minimumSize: const Size(140, 70),
                      ),
                      child: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 244, 214),
                              fontSize: 20),
                          "Cerrar\nsesión"),
                      onPressed: () => {
                        FirebaseAuth.instance.signOut(),
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()))
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:umind/screens/login.dart';
import 'package:umind/screens/perfil/consultas.dart';
import 'package:umind/screens/perfil/configuracion.dart';
import 'package:pelaicons/pelaicons.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:umind/screens/perfil/consultasAnteriores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

final List<Map<String, dynamic>> _datosConsulta = <Map<String, dynamic>>[];



class _PerfilState extends State<Perfil> {

  void getInfoConsultas() async {
    _datosConsulta.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("consultas");
    QuerySnapshot users = await collectionReference.get();
    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        _datosConsulta.add(doc.data() as Map<String, dynamic>);
      }
    }
    setState(() {});
  }
  
  @override
  void initState() {
    super.initState();
    getInfoConsultas();
  }

  @override
  Widget build(BuildContext context) {

    if (_datosConsulta.isEmpty){
      print("Datos vacios");
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Center(
          child: Text(
          'Cargando',
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 23, 56, 84)),
          ),
        )
      );
    }else{
      _datosConsulta.sort((a, b) {
        final DateTime fechaA = (a['Fecha'] as Timestamp).toDate();
        final DateTime fechaB = (b['Fecha'] as Timestamp).toDate();
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
                  children: [
                    const SizedBox(
                      width: 250,
                      child: Text('Joan Pozon\n  12.345.678-9',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 23, 56, 84))),
                    ),
                    SizedBox(
                      height: 140.0,
                      width: 140.0,
                      child: Image.asset('assets/mascota.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 320,
                  child: Text(
                    'Última Consulta',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 23, 56, 84)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 244, 214), // Cambia el color de fondo del Container (y, por lo tanto, del SizedBox)
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: Colors
                              .black) // Ajusta el radio de borde según tus preferencias
                      ),
                  width: 320,
                  height: 193,
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
                                    text: '${_datosConsulta[0]['Asunto']}',
                                    style: const TextStyle(fontWeight: FontWeight.bold)
                                  ),
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
                                    text: '${_datosConsulta[0]['Detalle']}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
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
                          "Ver\nConsultas",
                          textAlign: TextAlign.center),
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Consultas()))
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
                          "Cerrar\nSesión"),
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

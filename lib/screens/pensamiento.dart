// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/widget/penasamientosPasados.dart';
import 'inicio.dart';
import '/widget/dialogo.dart';

class Pensamiento extends StatefulWidget {
  const Pensamiento({Key? key}) : super(key: key);

  @override
  _PensamientoState createState() => _PensamientoState();
}

String _emocion = 'Felicidad';
//condiciones para visibilidad
bool condicionRow = true;
bool condicionContainer = false;

class _PensamientoState extends State<Pensamiento> {
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _emocion = selectedValue;
      });
    }
  }

  final _pregunta1 = TextEditingController();
  final _pregunta2 = TextEditingController();
  final List<Map<String, dynamic>> _datosUsuarios = <Map<String, dynamic>>[];
  final DateTime _fecha = DateTime.now();

  void getInfoPensamientos() async {
    _datosUsuarios.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Pruebas");
    QuerySnapshot users = await collectionReference.get();
    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        _datosUsuarios.add(doc.data() as Map<String, dynamic>);
      }
    }
    setState(() {});
  }

  Future<void> agregarDatos() async {
    try {
      // Referencia a la colección y documento en Firestore
      CollectionReference preguntasCollection =
          FirebaseFirestore.instance.collection('Pruebas');
      DocumentReference documento = preguntasCollection.doc();

      // Datos que se quieran agregar
      Map<String, dynamic> datos = {
        'emocion': _emocion,
        'fecha': _fecha, // Usar el Timestamp convertido
        'pregunta1': _pregunta1.text,
        'pregunta2': _pregunta2.text,
      };

      // Agregar los datos al documento
      await documento.set(datos);

      print('Datos agregados correctamente.');
    } catch (e) {
      print('Error al agregar datos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 30.0, left: 10, right: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  Text(style: TextStyle(fontSize: 20), "¿Qué pienso?"),
                ]),
                SizedBox(
                  height: 193,
                  width: 294,
                  child: TextField(
                    controller: _pregunta1,
                    maxLines: 6,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF4D6),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '....',
                    ),
                  ),
                ),
                //row 1
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  const Text(
                      style: TextStyle(fontSize: 20),
                      "¿Qué situación me\n hace pensar esto?"),
                ]),
                SizedBox(
                  height: 193,
                  width: 294,
                  child: TextField(
                    controller: _pregunta2,
                    maxLines: 6,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF4D6),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '....',
                    ),
                  ),
                ),
                //row 2
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  const Text(
                      style: TextStyle(fontSize: 20),
                      "¿Qué emoción me \n genera esto?"),
                ]),
                Container(
                  width: 294,
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.teal,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Colors.teal,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    borderRadius: BorderRadius.circular(30.0),
                    items: const [
                      DropdownMenuItem(
                        value: "Felicidad",
                        child: Center(
                            child: Text(
                                "Felicidad")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Tristeza",
                        child: Center(
                            child: Text(
                                "Tristeza")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Ira",
                        child: Center(
                            child:
                                Text("Ira")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Miedo",
                        child: Center(
                            child: Text(
                                "Miedo")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Asco",
                        child: Center(
                            child: Text(
                                "Asco")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Sorpresa",
                        child: Center(
                            child: Text(
                                "Sorpresa")), // Centra el texto horizontalmente
                      ),
                    ],
                    value: _emocion,
                    onChanged: dropdownCallback,
                  ),
                ),
                //row 3
                //Manejo y uso de Emociones pasadas
                Visibility(
                  visible: condicionRow,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            minimumSize: const Size(146, 70),
                          ),
                          child: const Text(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              "Pensamientos\npasados",
                              textAlign: TextAlign.center),
                          onPressed: () => {
                            setState(() {
                              getInfoPensamientos();
                              condicionRow = false;
                              condicionContainer = true;
                            })
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: const Size(146, 70),
                          ),
                          child: const Text(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              "Guardar"),
                          onPressed: () => {
                            agregarDatos(),
                            Dialogo.mostrarDialogo(
                                context,
                                'Datos',
                                'Se guardaron los datos',
                                () => {
                                      Inicio.cambiarTab(context, 0),
                                    }),
                          },
                        ),
                      ]),
                ),
                Visibility(
                    visible: condicionContainer,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            PensamientoPasado(pensamientos: _datosUsuarios),
                            Container(
                              margin: EdgeInsets.all(15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  minimumSize: const Size(294, 50),
                                ),
                                child: const Text(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  "Volver",
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    condicionRow = true;
                                    condicionContainer = false;
                                  })
                                },
                              ),
                            ),
                          ],
                        )))
                //row 4
              ],
            ),
          ),
        ),
      ),
    );
  }
}

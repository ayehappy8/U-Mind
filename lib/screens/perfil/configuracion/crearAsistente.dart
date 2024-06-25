import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umind/usuario_auth/firebase_auth_service/getUsuario.dart';
import '/widget/dialogo.dart';
import "package:umind/screens/inicio.dart";
import 'package:provider/provider.dart';
import 'package:umind/providers/assistant_provider.dart';
import 'package:umind/functions/getInfoAsistente.dart';

class CrearAsistente extends StatefulWidget {
  const CrearAsistente({Key? key}) : super(key: key);

  @override
  _CrearAsistenteState createState() => _CrearAsistenteState();
}

class _CrearAsistenteState extends State<CrearAsistente> {
  final _nombre = TextEditingController();

  Future<void> fetchInfoAsistente() async {
    List<Map<String, dynamic>> datos = await getInfoAsistente();
    Provider.of<AsistenteInfo>(context, listen: false).setDatosAsistente(datos);
  }

  Future<void> agregarDatos() async {
    try {
      // Referencia a la colección y documento en Firestore
      DocumentReference usuarioDocumnto = FirebaseFirestore.instance
          .collection('Usuarios')
          .doc(getCurrentUserId());
      CollectionReference pensamientoCollection =
          usuarioDocumnto.collection('Asistente');

      DocumentReference documento = pensamientoCollection.doc();

      //( Datos que se quieran agregar
      Map<String, dynamic> datos = {
        'mascota': _asistenteSeleccionado,
        'nombre': _nombre.text,
      };

      // Agregar los datos al documento
      await documento.set(datos);

      print('Datos agregados correctamente.');
    } catch (e) {
      print('Error al agregar datos: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getInfoAsistente();
  }

  String _asistenteSeleccionado = 'nutria';

  @override
  Widget build(BuildContext context) {
    //*************************Info************************//
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40, top: 50),
                  height: 180,
                  width: 450,
                  child: Image.asset('assets/Logo2.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: 320,
                  child: const Text(
                    "Personalizar asistente",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 23, 56, 84)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: 320,
                  child: Text(
                    "Asistente seleccionado:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 23, 56, 84)),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 130,
                              child: MyRadioMenuButton(
                                value: 'nutria',
                                groupValue: _asistenteSeleccionado,
                                onChanged: (selectedValue) {
                                  setState(() =>
                                      _asistenteSeleccionado = selectedValue!);
                                },
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  elevation: const WidgetStatePropertyAll(2),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.teal),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 86.0,
                                      child: Image.asset(
                                          'assets/asistentes/nutria.png'),
                                    ),
                                    const Text(
                                      'Nutria',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 236, 244, 214),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Radio<String>(
                                      value: 'nutria',
                                      groupValue: _asistenteSeleccionado,
                                      onChanged: (selectedValue) {
                                        setState(() => _asistenteSeleccionado =
                                            selectedValue!);
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 236, 244, 214),
                                      fillColor: WidgetStatePropertyAll(
                                          Color.fromARGB(255, 236, 244, 214)),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                              width: 130,
                              child: MyRadioMenuButton(
                                value: 'elefante',
                                groupValue: _asistenteSeleccionado,
                                onChanged: (selectedValue) {
                                  setState(() =>
                                      _asistenteSeleccionado = selectedValue!);
                                },
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  elevation: const WidgetStatePropertyAll(2),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.teal),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 86.0,
                                      child: Image.asset(
                                          'assets/asistentes/elefante.png'),
                                    ),
                                    const Text(
                                      'Elefante',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 236, 244, 214),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Radio<String>(
                                      value: 'elefante',
                                      groupValue: _asistenteSeleccionado,
                                      onChanged: (selectedValue) {
                                        setState(() => _asistenteSeleccionado =
                                            selectedValue!);
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 236, 244, 214),
                                      fillColor: WidgetStatePropertyAll(
                                          Color.fromARGB(255, 236, 244, 214)),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                              width: 130,
                              child: MyRadioMenuButton(
                                value: 'panda',
                                groupValue: _asistenteSeleccionado,
                                onChanged: (selectedValue) {
                                  setState(() =>
                                      _asistenteSeleccionado = selectedValue!);
                                },
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  elevation: const WidgetStatePropertyAll(2),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.teal),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 86.0,
                                      child: Image.asset(
                                          'assets/asistentes/panda.png'),
                                    ),
                                    const Text(
                                      'Panda',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 236, 244, 214),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Radio<String>(
                                      value: 'panda',
                                      groupValue: _asistenteSeleccionado,
                                      onChanged: (selectedValue) {
                                        setState(() => _asistenteSeleccionado =
                                            selectedValue!);
                                      },
                                      activeColor:
                                          Color.fromARGB(255, 236, 244, 214),
                                      fillColor: WidgetStatePropertyAll(
                                          Color.fromARGB(255, 236, 244, 214)),
                                    ),
                                  ],
                                ),
                              ))
                        ])),
                SizedBox(
                  height: 60,
                  width: 294,
                  child: TextField(
                    controller: _nombre,
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF4D6),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Nombre',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 38, 80, 115),
                                minimumSize: const Size(50, 50),
                              ),
                              child: const Text(
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 236, 244, 214),
                                      fontSize: 20),
                                  "Guardar",
                                  textAlign: TextAlign.center),
                              onPressed: (_nombre.text.isNotEmpty)
                                  ? () => {
                                        agregarDatos(),
                                        Dialogo.mostrarDialogo(
                                            context,
                                            'Datos',
                                            'Se actualizó el Asistente Correctamente',
                                            () => {
                                                  {
                                                    {
                                                      setState(() {
                                                        fetchInfoAsistente();
                                                      })
                                                    },
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Inicio()))
                                                  },
                                                }),
                                      }
                                  : null),
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
    //*************************Info************************//
  }
}

class MyRadioMenuButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final ButtonStyle style;
  final Widget child;

  const MyRadioMenuButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.style,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () => onChanged(value),
      child: child,
    );
  }
}

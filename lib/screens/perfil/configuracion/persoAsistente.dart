import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umind/usuario_auth/firebase_auth_service/getUsuario.dart';
import '/widget/dialogo.dart';

class PersoAsistente extends StatefulWidget {
  const PersoAsistente({Key? key}) : super(key: key);

  @override
  _PersoAsistenteState createState() => _PersoAsistenteState();
}

final List<Map<String, dynamic>> _datosAsistente = <Map<String, dynamic>>[];

class _PersoAsistenteState extends State<PersoAsistente> {
  final _nombre = TextEditingController();

  void getInfoAsistente() async {
    _datosAsistente.clear();
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(getCurrentUserId());
    QuerySnapshot consultas =
        await documentReference.collection("Asistente").get();

    if (consultas.docs.isNotEmpty) {
      for (var doc in consultas.docs) {
        _datosAsistente.add(doc.data() as Map<String, dynamic>);
      }
    }
    setState(() {});
    _asistenteSeleccionado = _datosAsistente[0]['mascota'];
  }

  Future<void> actualizarDatos() async {
    try {
      // Referencia a la colección y documento en Firestore
      DocumentReference usuarioDocumento = FirebaseFirestore.instance
          .collection('Usuarios')
          .doc(getCurrentUserId());
      CollectionReference asistenteCollection =
          usuarioDocumento.collection('Asistente');

      // Consulta para obtener el documento que coincide con ciertos criterios
      QuerySnapshot querySnapshot = await asistenteCollection.get();

      if (querySnapshot.docs.isEmpty) {
        print(
            'No se encontró ningún documento que coincida con los criterios.');
        return;
      }

      // Suponiendo que solo hay un documento que coincide con los criterios
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      String documentoId = documentSnapshot.id;

      DocumentReference documento = asistenteCollection.doc(documentoId);

      // Datos que se quieran actualizar
      Map<String, dynamic> datos = {
        'mascota': _asistenteSeleccionado,
        'nombre': _nombre.text,
      };

      // Actualizar los datos en el documento
      await documento.update(datos);

      print('Datos actualizados correctamente.');
    } catch (e) {
      print('Error al actualizar datos: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getInfoAsistente();
  }

  String _asistenteSeleccionado = 'Nutria';

  @override
  Widget build(BuildContext context) {
    if (_datosAsistente.isEmpty) {
      //*************************Esqueleto************************//
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
                ]),
          ),
        ),
      );
      //*************************Esqueleto************************//
    } else {
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
                                  value: 'Nutria',
                                  groupValue: _asistenteSeleccionado,
                                  onChanged: (selectedValue) {
                                    setState(() => _asistenteSeleccionado =
                                        selectedValue!);
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
                                          color: Color.fromARGB(
                                              255, 236, 244, 214),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Radio<String>(
                                        value: 'Nutria',
                                        groupValue: _asistenteSeleccionado,
                                        onChanged: (selectedValue) {
                                          setState(() =>
                                              _asistenteSeleccionado =
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
                                  value: 'Elefante',
                                  groupValue: _asistenteSeleccionado,
                                  onChanged: (selectedValue) {
                                    setState(() => _asistenteSeleccionado =
                                        selectedValue!);
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
                                          color: Color.fromARGB(
                                              255, 236, 244, 214),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Radio<String>(
                                        value: 'Elefante',
                                        groupValue: _asistenteSeleccionado,
                                        onChanged: (selectedValue) {
                                          setState(() =>
                                              _asistenteSeleccionado =
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
                                  value: 'Panda',
                                  groupValue: _asistenteSeleccionado,
                                  onChanged: (selectedValue) {
                                    setState(() => _asistenteSeleccionado =
                                        selectedValue!);
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
                                          color: Color.fromARGB(
                                              255, 236, 244, 214),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Radio<String>(
                                        value: 'Panda',
                                        groupValue: _asistenteSeleccionado,
                                        onChanged: (selectedValue) {
                                          setState(() =>
                                              _asistenteSeleccionado =
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
                        hintText: _datosAsistente[0]['nombre'],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 19, 18),
                                minimumSize: const Size(50, 50),
                              ),
                              child: const Text(
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 236, 244, 214),
                                      fontSize: 20),
                                  "Volver"),
                              onPressed: () => {Navigator.pop(context)},
                            ),
                          ),
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
                                        color:
                                            Color.fromARGB(255, 236, 244, 214),
                                        fontSize: 20),
                                    "Guardar",
                                    textAlign: TextAlign.center),
                                onPressed: (_nombre.text.isNotEmpty)
                                    ? () => {
                                          actualizarDatos(),
                                          Dialogo.mostrarDialogo(
                                              context,
                                              'Datos',
                                              'Se actualizó el Asistente Correctamente',
                                              () => {
                                                    {Navigator.pop(context)},
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

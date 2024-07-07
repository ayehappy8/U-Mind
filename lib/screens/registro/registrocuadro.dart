import 'package:flutter/material.dart';
import 'package:umind/functions/getInfo.dart';
import 'package:umind/screens/inicio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/widget/dialogo.dart';
import 'package:umind/providers/assistant_provider.dart';
import 'package:provider/provider.dart';

class Registrocuadro extends StatefulWidget {
  final String data;
  final String data2;
  Registrocuadro({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  _RegistrocuadroState createState() => _RegistrocuadroState();
}

class _RegistrocuadroState extends State<Registrocuadro> {
  String _emocion1 = 'alegria';
  String _emocion2 = 'Felicidad';
  final _detalle = TextEditingController();

  final DateTime _fecha = DateTime.now();

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null; // El usuario no está autenticado
    }
  }

  Future<void> agregarDatos() async {
    try {
      // Referencia a la colección y documento en Firestore
      DocumentReference usuarioDocumnto = FirebaseFirestore.instance
          .collection('Usuarios')
          .doc(getCurrentUserId());
      CollectionReference pensamientoCollection =
          usuarioDocumnto.collection('Registro');

      DocumentReference documento = pensamientoCollection.doc();

      //( Datos que se quieran agregar
      Map<String, dynamic> datos = {
        'emocion1': _emocion1,
        'fecha': _fecha, // Usar el Timestamp convertido
        'emocion2': _emocion2,
        'detalle': _detalle.text,
      };

      // Agregar los datos al documento
      await documento.set(datos);

      print('Datos agregados correctamente.');
    } catch (e) {
      print('Error al agregar datos: $e');
    }
  }

  Future<void> fetchInfoRegistro() async {
    List<Map<String, dynamic>> datos = await getInfoRegistro();
    Provider.of<RegistroInfo>(context, listen: false).setDatosRegistro(datos);
  }

  @override
  Widget build(BuildContext context) {
    final asistenteInfo = Provider.of<AsistenteInfo>(context);
    return GestureDetector(
      onTap: () {
        // Oculta el teclado cuando se toca fuera de un widget de entrada de texto
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Profundiza tu emoción",
                      style: TextStyle(fontSize: 25)),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset(
                          'assets/asistentes/${asistenteInfo.datosAsistente[0]['mascota']}.png'),
                    ),
                  ),
                  SizedBox(
                    height: 283.0,
                    width: 303.0,
                    child: TextField(
                      controller: _detalle,
                      maxLines: 9,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFECF4D6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: '...',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: const Size(146, 45),
                      ),
                      onPressed: () async {
                        // Acción al presionar el botón

                        _emocion1 = (widget.data);
                        _emocion2 = (widget.data2);

                        await agregarDatos();

                        fetchInfoRegistro();

                        Dialogo.mostrarDialogo(
                            context,
                            'Registro',
                            'Se guardo su registro diario',
                            () => {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Inicio()),
                                    (Route<dynamic> route) =>
                                        false, // No permite volver a ninguna pantalla anterior
                                  )
                                });
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
      ),
    );
  }
}

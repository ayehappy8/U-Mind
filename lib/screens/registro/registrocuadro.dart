import 'package:flutter/material.dart';
import 'package:umind/screens/inicio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Registrocuadro extends StatefulWidget {
  final String data;
  const Registrocuadro({Key? key, required this.data}) : super(key: key);

  @override
  _RegistrocuadroState createState() => _RegistrocuadroState();
}

class _RegistrocuadroState extends State<Registrocuadro> {

final _emocion = Text(widget.data);
final String _pregunta1 = 'Felicidad';
final String _pregunta2 = 'Felicidad';

final List<Map<String, dynamic>> _datosUsuarios = <Map<String, dynamic>>[];
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
        'emocion': _emocion,
        'fecha': _fecha, // Usar el Timestamp convertido
        'pregunta1': _pregunta1,
        'pregunta2': _pregunta2,
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
                  const Text("Profundiza tu emoción", style: TextStyle(fontSize: 25)),

                  SizedBox(
                    height: 300.0,
                    width: 350.0,
                    child: Image.asset('assets/mascota.png'),
                  ),

                  SizedBox(
                    height: 283.0,
                    width: 303.0,
                    child: TextField(
                      maxLines: 9,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFECF4D6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: '....',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: const Size(146, 45),
                      ),
                      onPressed: () {
                        // Acción al presionar el botón
                        agregarDatos();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Inicio()),
                          (Route<dynamic> route) => false,  // No permite volver a ninguna pantalla anterior
                        );

                        

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
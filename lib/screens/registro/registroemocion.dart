import 'package:flutter/material.dart';
import 'package:umind/screens/registro/registrocuadro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Registroemocion extends StatefulWidget {
  const Registroemocion({Key? key}) : super(key: key);

  @override
  _RegistroemocionState createState() => _RegistroemocionState();
}

String _emocion = 'Felicidad';
String _pregunta1 = 'Felicidad';
String _pregunta2 = 'Felicidad';

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


class _RegistroemocionState extends State<Registroemocion> {
  List<String> buttonNames = [
    'Felicidad',
    'Tristeza',
    'Ira',
    'Miedo',
    'Asco',
    'Sorpresa',
  ];

  void changeButtonNames(int index) {
    setState(() {
      // Cada botón puede tener su propia lógica de cambio
      switch (index) {
        case 0:  // Para 'Felicidad'
          buttonNames = [
            'Alegre',
            'Interesado',
            'Orgulloso',
            'Aceptado',
            'Poderoso',
            'Pacifico',
            'Intimo',
            'Optimista',
          ];
          break;
        case 1:  // Para 'Tristeza'
          buttonNames = [
            'Culpable',
            'Abandonado',
            'Desesperado',
            'Deprimido',
            'Solo',
            'Aburrido',
          ];
          break;
        case 2:  // Para 'Ira'
          buttonNames = [
            'Herido',
            'Amenazado',
            'Odio',
            'Loco',
            'Agresivo',
            'Frustrado',
            'Distante',
            'Critico',
          ];
          break;
          case 3:  // Para 'Miedo'
          buttonNames = [
            'Humillado',
            'Rechazado',
            'Sumiso',
            'Inseguro',
            'Ancioso',
            'Asustado',
          ];
          break;
          case 4:  // Para 'Asco'
          buttonNames = [
            'Disconforme',
            'Decepcionado',
            'Horrible',
            'Abstinencia',
          ];
          break;
          case 5:  // Para 'Sorpresa'
          buttonNames = [
            'Sorprendido',
            'Confundido',
            'Asombrado',
            'Entusiasmado',
          ];
          break;
        default:
          // Dejar los nombres como están o cambiarlos a algo por defecto
          break;
      }
    });
  }

  double ratio = 2/1;
  bool cont = false;
  String _text= "¿Qué sientes hoy?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_text, style: const TextStyle(fontSize: 25)),
                SizedBox(
                  height: 300.0,
                  width: 350.0,
                  child: Image.asset('assets/mascota.png'),
                ),
                SizedBox(
                  height: 300.0,
                  width: 350.0,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: ratio,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(buttonNames.length, (index) {
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: const Size(146, 45),
                          ),
                          onPressed: () {
                            if (cont == true) {
                              agregarDatos();

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Registrocuadro()),
                              );
                            }
                            cont = true;
                            _text= "¿Y más especificamente?";
                            ratio=10/4;
                            
                            // Cambia los nombres basándose en el botón presionado
                            changeButtonNames(index);
                          },
                          child: Text(
                            buttonNames[index],   //nombres de los botones
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

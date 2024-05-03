import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PensamientoPasado extends StatefulWidget {
  const PensamientoPasado({Key? key}) : super(key: key);

  @override
  _PensamientoPasadoState createState() => _PensamientoPasadoState();
}

final int _rowsPorPagina = 5;
int _paginaActual = 0;
final List<Map<String, dynamic>> _datosUsuarios = <Map<String, dynamic>>[];

class _PensamientoPasadoState extends State<PensamientoPasado> {
  @override
  void initState() {
    super.initState();

    getInfoPensamientos();
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null; // El usuario no está autenticado
    }
  }

  void getInfoPensamientos() async {
    _datosUsuarios.clear();
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(getCurrentUserId());
    QuerySnapshot pensamientos =
        await documentReference.collection("Pensamientos").get();

    if (pensamientos.docs.isNotEmpty) {
      for (var doc in pensamientos.docs) {
        _datosUsuarios.add(doc.data() as Map<String, dynamic>);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final rowsTotales = _datosUsuarios.length;
    final paginasTotales = (rowsTotales / _rowsPorPagina).ceil();
    final paginaInicial = _paginaActual * _rowsPorPagina;
    final paginaFinal = (_paginaActual + 1) * _rowsPorPagina;

    _datosUsuarios.sort((a, b) {
      final DateTime fechaA = (a['fecha'] as Timestamp).toDate();
      final DateTime fechaB = (b['fecha'] as Timestamp).toDate();
      return fechaB.compareTo(fechaA);
    });
    final rowsDeLaPaginaActual = _datosUsuarios.sublist(
        paginaInicial, paginaFinal > rowsTotales ? rowsTotales : paginaFinal);

    return Column(children: [
      DataTable(
          columnSpacing: 40,
          columns: const [
            DataColumn(
              label: Text(
                "Emoción",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            DataColumn(
                label: Text(
              "Fecha",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            DataColumn(
                label: Text(
              "Detalle",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
          ],
          rows: _buildRows(context, rowsDeLaPaginaActual)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: _paginaActual > 0
                ? () {
                    setState(() {
                      _paginaActual--;
                    });
                  }
                : null,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Text(
            "Página ${_paginaActual + 1} de $paginasTotales",
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: _paginaActual < paginasTotales - 1
                ? () {
                    setState(() {
                      _paginaActual++;
                    });
                  }
                : null,
            icon: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    ]);
  }
}

//Construye los rows
List<DataRow> _buildRows(
    BuildContext context, List<Map<String, dynamic>> pensamientos) {
  //Formato de la fecha
  final DateFormat formato = DateFormat('dd-MM-yyyy');
  // Ordenar los pensamientos por fecha

  return pensamientos.map((pensamiento) {
    final DateTime fecha = (pensamiento['fecha'] as Timestamp).toDate();
    return DataRow(cells: [
      DataCell(Text(
        pensamiento['emocion'],
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )),
      DataCell(
        Text(
          //Transformar la fecha a string con el formato correcto
          formato.format(fecha),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      DataCell(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            backgroundColor: Colors.blue[900],
          ),
          onPressed: () {
            _mostrarInformacion(context, pensamiento);
          },
          child: const Text(
            "Ver",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }).toList();
}

// Función para mostrar la información en un diálogo
void _mostrarInformacion(
    BuildContext context, Map<String, dynamic> pensamiento) {
  final DateFormat formato = DateFormat('dd-MM-yyyy');
  final DateTime fecha = (pensamiento['fecha'] as Timestamp).toDate();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        content: Container(
          padding: const EdgeInsets.all(20), // Padding dentro del contenedor
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Detalle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Emoción: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: '${pensamiento['emocion']}',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Fecha: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: formato.format(fecha),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text: '¿Qué pensé?: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '${pensamiento['pregunta1']}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text: '¿Qué situación me hizo pensar eso?:  ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '${pensamiento['pregunta2']}',
                    ),
                  ],
                ),
              ),
              // Agrega aquí más información que desees mostrar
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cerrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umind/screens/pensamiento.dart';
import 'package:intl/intl.dart';

class PensamientoPasado extends StatefulWidget {
  final List<Map<String, dynamic>> pensamientos;

  const PensamientoPasado({Key? key, required this.pensamientos})
      : super(key: key);

  @override
  _PensamientoPasadoState createState() => _PensamientoPasadoState();
}

class _PensamientoPasadoState extends State<PensamientoPasado> {
  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const [
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
      DataColumn(label: SizedBox())
    ], rows: _buildRows(context, widget.pensamientos));
  }
}

//Construye los rows
List<DataRow> _buildRows(
    BuildContext context, List<Map<String, dynamic>> pensamientos) {
  //Formato de la fecha
  final DateFormat formato = DateFormat('dd-MM-yyyy');
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
      DataCell(Container(
        margin: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.blue[900],
          ),
          onPressed: () {
            _mostrarInformacion(context, pensamiento);
          },
          child: const Text(
            "Ver",
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      )),
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
        backgroundColor: Colors
            .transparent, // Fondo transparente para que el contenedor sobresalga
        contentPadding: EdgeInsets
            .zero, // Padding cero para que el contenedor ocupe todo el espacio disponible
        insetPadding: EdgeInsets.symmetric(
            horizontal: 40), // Padding alrededor del contenedor
        content: Container(
          padding: EdgeInsets.all(20), // Padding dentro del contenedor
          decoration: BoxDecoration(
            color: Colors.teal, // Color de fondo personalizado
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
                children: [
                  Text(
                    "Emcocion : ${pensamiento['emocion']} ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Fecha : ${formato.format(fecha)} ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "¿Qué pensé?: ${pensamiento['pregunta1']}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "¿Qué situación me hizo pensar eso?: ${pensamiento['pregunta2']}",
                style: TextStyle(color: Colors.white),
              ),
              // Agrega aquí más información que desees mostrar
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cerrar",
                      style: TextStyle(color: Colors.white),
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

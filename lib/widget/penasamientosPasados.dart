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
    print("dentro de pasados ${widget.pensamientos}");
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
    ], rows: _buildRows(widget.pensamientos));
  }
}

//Construye los rows
List<DataRow> _buildRows(List<Map<String, dynamic>> pensamientos) {
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
            // Acción al presionar el botón
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Consultas extends StatelessWidget {
  const Consultas({super.key});

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
                const SizedBox(
                  width: 320,
                  child: Text("Consultas Anteriores", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 23, 56, 84)
                    ),
                  ),
                ),
                const SizedBox(
                  width:350,
                  height: 330,
                  child: DataConsultas(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 179, 19, 18),
                    minimumSize: const Size(294, 50),
                  ),
                  child: const Text(
                      style: TextStyle(
                          color: Color.fromARGB(255, 236, 244, 214),
                          fontSize: 20),
                      "Volver"),
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class DataConsultas extends StatelessWidget {
  const DataConsultas({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Asunto',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Fecha',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Detalle',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Primera Sesion')),
            DataCell(Text('01/01/2023')),
            DataCell(Text('Primera sesión de acercamiento con el estudiante')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Ansiedad')),
            DataCell(Text('04/02/2023')),
            DataCell(Text('Estudiante demuestra sintomas de ansiedad')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Manejo de Ansiedad')),
            DataCell(Text('03/03/2023')),
            DataCell(Text('Estudiante logra manejar su ansiedad, controlando sus tiempos.')),
          ],
        ),
      ],
    );
  }
}

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
                Container(
                  margin: const EdgeInsets.only(bottom: 40, top: 15),
                  height: 180,
                  width: 450,
                  child: Image.asset(
                    'assets/Logo2.png'
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
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

class MyDataSource extends DataTableSource{
  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return const DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        );
      case 1:
        return const DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        );
      case 2:
        return const DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        );
      default:
        return null;
    }
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 3;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
  
}
final DataTableSource dataSource = MyDataSource();

class DataConsultas extends StatelessWidget {
  const DataConsultas({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
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
      source: dataSource,
      header: const Center(child: Text("Consultas Anteriores", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 23, 56, 84)
                    ),
                  ),),
      columnSpacing: 100,
      horizontalMargin: 20,
      rowsPerPage: 4,
    );
  }
}

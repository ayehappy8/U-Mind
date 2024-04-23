import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  _ConsultasState createState() => _ConsultasState();
}

final List<Map<String, dynamic>> _datosConsulta = <Map<String, dynamic>>[];


class _ConsultasState extends State<Consultas>{


  void getInfoConsultas() async {
    _datosConsulta.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("consultas");
    QuerySnapshot users = await collectionReference.get();
    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        _datosConsulta.add(doc.data() as Map<String, dynamic>);
        
      }

    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getInfoConsultas();
    
  }

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
                  margin: const EdgeInsets.only(bottom: 50),
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
    final DateFormat formato = DateFormat('dd-MM-yyyy');
    final DateTime fecha = (_datosConsulta[index] ["Fecha"] as Timestamp).toDate();

    
    return DataRow(cells: [
      DataCell(Text(_datosConsulta[index]['Asunto'], style: TextStyle(color: Color.fromARGB(255, 23, 56, 84)),)),
      DataCell(Text(formato.format(fecha), style: TextStyle(color: Color.fromARGB(255, 23, 56, 84)),)),
      DataCell(Text(_datosConsulta[index]['Detalle'], style: TextStyle(color: Color.fromARGB(255, 23, 56, 84)),))
      
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _datosConsulta.length;


  @override
  int get selectedRowCount => 0;
  
}



class DataConsultas extends StatefulWidget {
  const DataConsultas({Key? key}) : super(key: key);


  @override
  DataConsultasState createState() => DataConsultasState();

}

class DataConsultasState extends State<DataConsultas>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Theme(data: ThemeData(
        cardTheme: CardTheme(color: Color.fromARGB(255, 45, 149, 150)),
        primaryColor: Color.fromARGB(255, 236, 244, 214),
        dataTableTheme: DataTableThemeData(
          dataRowColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.08);
            }
            return Color.fromARGB(255, 236, 244, 214);
          }),
          headingRowColor: MaterialStateProperty.all(Color.fromARGB(255, 236, 244, 214)),
          headingTextStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      child: PaginatedDataTable(
        arrowHeadColor: Color.fromARGB(255, 236, 244, 214),
        
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Asunto',
                style: TextStyle(color: Color.fromARGB(255, 23, 56, 84)),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Fecha',
                style: TextStyle(color: Color.fromARGB(255, 23, 56, 84)),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Detalle',
                style: TextStyle(color: Color.fromARGB(255, 23, 56, 84)),
              ),
            ),
          ),
        ],
        source: MyDataSource(),
        header: Text("Consultas Anteriores", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 236, 244, 214)
                      ),
                    ),
        columnSpacing: 100,
        horizontalMargin: 20,
        rowsPerPage: 4,
        
        
        
      )
    );
  }
}
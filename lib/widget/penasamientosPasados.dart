import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
        DataColumn(label: SizedBox())
      ],
      rows: [
        DataRow(cells: [
          const DataCell(Text(
            "Alegria",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          const DataCell(
            Text(
              "11-10-23",
              style: TextStyle(color: Colors.white, fontSize: 20),
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
              ))),
        ]),
        DataRow(cells: [
          const DataCell(Text(
            "Tristeza",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          const DataCell(
            Text(
              "18-10-23",
              style: TextStyle(color: Colors.white, fontSize: 20),
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
              ))),
        ]),
        DataRow(cells: [
          const DataCell(Text(
            "Asco",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          const DataCell(
            Text(
              "22-10-23",
              style: TextStyle(color: Colors.white, fontSize: 20),
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
              ))),
        ]),
        DataRow(cells: [
          const DataCell(Text(
            "Asco",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          const DataCell(
            Text(
              "23-10-23",
              style: TextStyle(color: Colors.white, fontSize: 20),
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
              ))),
        ])
      ],
    );
  }
}

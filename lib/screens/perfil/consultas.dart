import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:umind/screens/perfil/consultasAnteriores.dart';


class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  _ConsultasState createState() => _ConsultasState();
}


class _ConsultasState extends State<Consultas>{
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
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      ConsultasAnteriores(),
                    ],
                  )
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

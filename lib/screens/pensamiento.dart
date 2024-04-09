import 'package:flutter/material.dart';

class Pensamiento extends StatefulWidget {
  const Pensamiento({Key? key}) : super(key: key);

  @override
  _PensamientoState createState() => _PensamientoState();
}

String _emocion = 'Felicidad';

class _PensamientoState extends State<Pensamiento> {
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _emocion = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 30.0, left: 10, right: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  const Text(style: TextStyle(fontSize: 20), "¿Qué pienso?"),
                ]),
                const SizedBox(
                  height: 193,
                  width: 294,
                  child: TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF4D6),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: '....',
                    ),
                  ),
                ),
                //row 1
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  const Text(
                      style: TextStyle(fontSize: 20),
                      "¿Qué situación me\n hace pensar esto?"),
                ]),
                const SizedBox(
                  height: 193,
                  width: 294,
                  child: TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF4D6),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: '....',
                    ),
                  ),
                ),
                //row 2
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/mascota.png'),
                  ),
                  const Text(
                      style: TextStyle(fontSize: 20),
                      "¿Qué emoción me \n genera esto?"),
                ]),
                Container(
                  width: 294,
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.teal,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Colors.teal,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    borderRadius: BorderRadius.circular(30.0),
                    items: const [
                      DropdownMenuItem(
                        value: "Felicidad",
                        child: Center(
                            child: Text(
                                "Felicidad")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Tristeza",
                        child: Center(
                            child: Text(
                                "Tristeza")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Ira",
                        child: Center(
                            child:
                                Text("Ira")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Miedo",
                        child: Center(
                            child: Text(
                                "Miedo")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Asco",
                        child: Center(
                            child: Text(
                                "Asco")), // Centra el texto horizontalmente
                      ),
                      DropdownMenuItem(
                        value: "Sorpresa",
                        child: Center(
                            child: Text(
                                "Sorpresa")), // Centra el texto horizontalmente
                      ),
                    ],
                    value: _emocion,
                    onChanged: dropdownCallback,
                  ),
                ),
                //row 3
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          minimumSize: const Size(146, 70),
                        ),
                        child: const Text(
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            "Pensamientos\npasados"),
                        onPressed: () => {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: const Size(146, 70),
                        ),
                        child: const Text(
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            "Guardar"),
                        onPressed: () => {},
                      ),
                    ]),
                //row 4
              ],
            ),
          ),
        ),
      ),
    );
  }
}

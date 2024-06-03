import 'package:flutter/material.dart';

class PersoAsistente extends StatefulWidget {
  const PersoAsistente({Key? key}) : super(key: key);

  @override
  _PersoAsistenteState createState() => _PersoAsistenteState();
}

class _PersoAsistenteState extends State<PersoAsistente>{

  final _nombre = TextEditingController();
  String asistenteSeleccionado = 'Ninguno seleccionado';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40, top: 50),
                height: 180,
                width: 450,
                child: Image.asset(
                  'assets/Logo2.png'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                width: 320,
                child: const Text("Personalizar asistente", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 23, 56, 84)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                width: 320,
                child: Text("Asistente seleccionado:", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 23, 56, 84)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 130,
                      child: MyRadioMenuButton(
                        value: 'Nutria',
                        groupValue: asistenteSeleccionado,
                        onChanged: (selectedValue) {
                          setState(() => asistenteSeleccionado = selectedValue!);
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(2),
                          backgroundColor: WidgetStatePropertyAll(Colors.teal),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 86.0,
                              child: Image.asset('assets/mascota.png'),
                            ),
                            const Text(
                              'Nutria',
                              style: TextStyle(
                                color: Color.fromARGB(255, 236, 244, 214),
                                fontSize: 20,
                              ),
                            ),
                            Radio<String>(
                              value: 'Nutria',
                              groupValue: asistenteSeleccionado,
                              onChanged: (selectedValue) {
                                setState(() => asistenteSeleccionado = selectedValue!);
                              },
                              activeColor: Color.fromARGB(255, 236, 244, 214),
                              fillColor: WidgetStatePropertyAll(Color.fromARGB(255, 236, 244, 214)),
                            ),
                          ],
                        ),
                      )
                    ),
                    SizedBox(
                      width: 130,
                      child: MyRadioMenuButton(
                        value: 'Elefante',
                        groupValue: asistenteSeleccionado,
                        onChanged: (selectedValue) {
                          setState(() => asistenteSeleccionado = selectedValue!);
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(2),
                          backgroundColor: WidgetStatePropertyAll(Colors.teal),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 86.0,
                              child: Image.asset('assets/mascota.png'),
                            ),
                            const Text(
                              'Elefante',
                              style: TextStyle(
                                color: Color.fromARGB(255, 236, 244, 214),
                                fontSize: 20,
                              ),
                            ),
                            Radio<String>(
                              value: 'Elefante',
                              groupValue: asistenteSeleccionado,
                              onChanged: (selectedValue) {
                                setState(() => asistenteSeleccionado = selectedValue!);
                              },
                              activeColor: Color.fromARGB(255, 236, 244, 214),
                              fillColor: WidgetStatePropertyAll(Color.fromARGB(255, 236, 244, 214)),
                            ),
                          ],
                        ),
                      )
                    ),
                    SizedBox(
                      width: 130,
                      child: MyRadioMenuButton(
                        value: 'Panda',
                        groupValue: asistenteSeleccionado,
                        onChanged: (selectedValue) {
                          setState(() => asistenteSeleccionado = selectedValue!);
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(2),
                          backgroundColor: WidgetStatePropertyAll(Colors.teal),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 86.0,
                              child: Image.asset('assets/mascota.png'),
                            ),
                            const Text(
                              'Panda',
                              style: TextStyle(
                                color: Color.fromARGB(255, 236, 244, 214),
                                fontSize: 20,
                              ),
                            ),
                            Radio<String>(
                              value: 'Panda',
                              groupValue: asistenteSeleccionado,
                              onChanged: (selectedValue) {
                                setState(() => asistenteSeleccionado = selectedValue!);
                              },
                              activeColor: Color.fromARGB(255, 236, 244, 214),
                              fillColor: WidgetStatePropertyAll(Color.fromARGB(255, 236, 244, 214)),
                            ),
                          ],
                        ),
                      )
                    )
                  ]
                )
              ),
              SizedBox(
                height: 60,
                width: 294,
                child: TextField(
                  controller: _nombre,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFECF4D6),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Nombre',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 179, 19, 18),
                          minimumSize: const Size(50, 50),
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
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 38, 80, 115),
                          minimumSize: const Size(50, 50),
                        ),
                        child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 244, 214),
                                fontSize: 20),
                            "Guardar",
                            textAlign: TextAlign.center),
                        onPressed: () => {},
                      ),
                    ),
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

class MyRadioMenuButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final ButtonStyle style;
  final Widget child;

  const MyRadioMenuButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.style,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () => onChanged(value),
      child: child,
    );
  }
}
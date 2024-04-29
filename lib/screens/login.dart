import "package:flutter/material.dart";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/ulagos.png'),
              const Text(style: TextStyle(fontSize: 35), "Inicio de sesión"),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(style: TextStyle(fontSize: 20), "Usuario:"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210,
                            height: 40,
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                fillColor: const Color(0xFFECF4D6),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Correo',
                              ),
                            ),
                          ),
                          Text(style: TextStyle(fontSize: 18), "@"),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                fillColor: Color(0xFFECF4D6),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'alumnos.ulagos.cl',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(style: TextStyle(fontSize: 20), "Contraseña:"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 375,
                            height: 40,
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                fillColor: const Color(0xFFECF4D6),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Contraseña',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      minimumSize: const Size(294, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        "Iniciar sesión")),
              )
            ],
          ),
        ));
  }
}

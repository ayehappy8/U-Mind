import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:umind/usuario_auth/firebase_auth_service/firebase_auth_service.dart";
import "inicio.dart";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.singInwithEmailAndPassword(email, password);

    if (user != null) {
      print("Se ha logiado con exito");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Inicio()));
    } else {
      print("Error en el login");
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Logo universidad
              Image.asset('assets/ulagos.png'),
              const Text(style: TextStyle(fontSize: 35), "Inicio de sesión"),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(style: TextStyle(fontSize: 20), "Usuario:"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 375,
                            height: 40,
                            child: TextField(
                              controller: _emailController,
                              style: const TextStyle(fontSize: 12),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                fillColor: const Color(0xFFECF4D6),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Correo Institucional',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(style: TextStyle(fontSize: 20), "Contraseña:"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 375,
                            height: 40,
                            child: TextField(
                              controller: _passwordController,
                              style: const TextStyle(fontSize: 12),
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
                    onPressed: () {
                      _signIn();
                    },
                    child: const Text(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        "Iniciar sesión")),
              )
            ],
          ),
        ));
  }
}

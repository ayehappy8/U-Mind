import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:umind/screens/perfil/configuracion/crearAsistente.dart";
import 'package:umind/usuario_auth/firebase_auth_service/getUsuario.dart';
import "package:umind/usuario_auth/firebase_auth_service/firebase_auth_service.dart";
import '/widget/dialogo.dart';
import "inicio.dart";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final List<Map<String, dynamic>> _datosAsistente = <Map<String, dynamic>>[];

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  void getInfoAsistente() async {
    _datosAsistente.clear();
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(getCurrentUserId());
    QuerySnapshot consultas =
        await documentReference.collection("Asistente").get();

    if (consultas.docs.isNotEmpty) {
      for (var doc in consultas.docs) {
        _datosAsistente.add(doc.data() as Map<String, dynamic>);
      }
    }
    setState(() {});
  }

//Funcion de inicio de sesion con firebaseauth
  void _signIn() async {
    getInfoAsistente();
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.singInwithEmailAndPassword(email, password);

    if (user != null) {
      print("Se ha logiado con exito");
      //navegación hacia inicio
      if (_datosAsistente.isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CrearAsistente()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Inicio()));
      }
    } else {
      print("Error en el login");
      Dialogo.mostrarDialogo(
          context, 'Error', 'Correo y/o contraseña Equivocada', () => {});
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInfoAsistente();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                            width: 360,
                            height: 50,
                            child: TextField(
                              controller: _emailController,
                              style: const TextStyle(fontSize: 14),
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
                            width: 360,
                            height: 50,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: const TextStyle(fontSize: 14),
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

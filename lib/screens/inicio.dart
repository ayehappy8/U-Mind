import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/widget/customAppBar.dart';
import '/widget/chat.dart';
import 'pensamiento.dart';
import 'registro.dart';
import 'capsulas.dart';
import 'perfil.dart';

class Inicio extends StatefulWidget {
  //Este metodo ayuda a cambiar de pagina desde otra screen
  static void cambiarTab(BuildContext context, int pageIndex) {
    final _InicioState? state = context.findAncestorStateOfType<_InicioState>();
    if (state != null) {
      state.moverPagina(pageIndex);
    }
  }

  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      return user.uid;
    } else {
      return null; // El usuario no está autenticado
    }
  }

  String userId = '';
  @override
  void initState() {
    super.initState();
    print("id usuario ${getCurrentUserId()}");
    getCurrentUserId();
    getUsers();
    getPensamientos();
  }

  void moverPagina(int pagina) {
    setState(() {
      _paginaActual = pagina;
      _controladorPagina.jumpToPage(pagina);
    });
  }

  final PageController _controladorPagina = PageController();
  int _paginaActual = 0;

  void getUsers() async {
    try {
      // Obtener una referencia al documento específico
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("Usuario")
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        // Acceder a los datos del documento
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // Imprimir los datos del documento
        print("Datos del Documento: ${data}");
      }
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir
      print("Error al obtener los usuarios: $e");
    }
  }

  final List<Map<String, dynamic>> _datosUsuarios = <Map<String, dynamic>>[];
  void getPensamientos() async {
    // Obtener una referencia al documento específico
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Usuario").doc(userId);
    QuerySnapshot pensamientos =
        await documentReference.collection("Pensamiento").get();
    if (pensamientos.docs.isNotEmpty) {
      for (var doc in pensamientos.docs) {
        _datosUsuarios.add(doc.data() as Map<String, dynamic>);
      }
      print(_datosUsuarios);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 190,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: 150.0,
                width: 450.0,
                child: Image.asset(
                  'assets/logo.png',
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        bottomWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.teal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTab(0, 'Registro'),
              buildTab(1, 'Pensamiento'),
              buildTab(2, 'Cápsulas'),
              buildTab(3, 'Perfil'),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _controladorPagina,
        onPageChanged: (int page) {
          setState(() {
            _paginaActual = page;
          });
        },
        children: const [
          Registro(),
          Pensamiento(),
          Capsulas(),
          Perfil(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mostrar la ventana emergente de chat
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChatPopup();
            },
          );
        },
        child: const Icon(Icons.chat_bubble),
      ),
    );
  }

  Widget buildTab(int index, String title) {
    return GestureDetector(
      onTap: () {
        _controladorPagina.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Text(
        title,
        style: TextStyle(
          color: _paginaActual == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

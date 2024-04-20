import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  void initState() {
    super.initState();
    getUsers();
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
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Pruebas");

    QuerySnapshot users = await collectionReference.get();
    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        print(doc.data());
      }
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

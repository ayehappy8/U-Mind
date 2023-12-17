import 'package:flutter/material.dart';
import '/widget/customAppBar.dart';
import '/widget/chat.dart';
import 'pensamiento.dart';
import 'registro.dart';
import 'capsulas.dart';
import 'perfil.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final PageController _controladorPagina = PageController();
  int _PaginaActual = 0;

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
            _PaginaActual = page;
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
          color: _PaginaActual == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

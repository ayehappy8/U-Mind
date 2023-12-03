import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

List<String> titulos = <String>[
  'Registro',
  'Pensamiento',
  'Cápsulas',
  'Perfil'
];
void main() => runApp(const UMind());

class UMind extends StatelessWidget {
  const UMind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          accentColor: const Color.fromARGB(255, 154, 208, 194),
        ),
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titulos.length,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        appBar: CustomAppBar(
          height: 190,
          appBar: AppBar(
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Registro',
                  style: TextStyle(color: Colors.white),
                ),
                Text('Pensamiento', style: TextStyle(color: Colors.white)),
                Text('Cápsulas', style: TextStyle(color: Colors.white)),
                Text('Perfil', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300.0,
                      width: 350.0,
                      child: Image.asset('assets/mascota.png'),
                    ),
                    SizedBox(
                        width: 350,
                        child: TableCalendar(
                            focusedDay: DateTime.now(),
                            firstDay: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            lastDay:
                                DateTime.now().add(const Duration(days: 365)))),
                  ],
                ),
              ),
            )),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          tooltip: 'Chatt',
          child: Icon(Icons.chat_bubble),
        ),
      ),
    );
  }
}

//Creación de la custom appbar
class CustomAppBar extends StatelessWidget implements PreferredSize {
  final AppBar appBar;
  final Widget bottomWidget;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.appBar,
    required this.bottomWidget,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 187, 222, 202),
            child: appBar,
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 5,
            child: Material(
              //elevation: 2,
              child: bottomWidget,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(height);
}

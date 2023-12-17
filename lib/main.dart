import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'widget/customAppBar.dart';
import 'widget/chat.dart';

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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .teal, // Cambia el color de fondo del Container (y, por lo tanto, del SizedBox)
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajusta el radio de borde según tus preferencias
                      ),
                      width: 350,
                      child: TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay:
                            DateTime.now().subtract(const Duration(days: 365)),
                        lastDay: DateTime.now().add(const Duration(days: 365)),
                        calendarStyle: const CalendarStyle(
                          // Cambia el color de fondo del calendario aquí
                          outsideDaysVisible: true,
                          defaultTextStyle: TextStyle(color: Colors.white),
                        ),
                        headerStyle: const HeaderStyle(
                          titleTextStyle: TextStyle(
                            color: Colors
                                .white, // Cambia el color del título del mes a blanco aquí
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
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
          child: Icon(Icons.chat_bubble),
        ),
      ),
    );
  }
}

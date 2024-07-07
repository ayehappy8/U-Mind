import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:umind/screens/registro/registroemocion.dart';
import 'package:umind/providers/assistant_provider.dart';
import 'package:provider/provider.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asistenteInfo = Provider.of<AsistenteInfo>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: SizedBox(
                      height: 200.0,
                      child: InkWell(
                        onTap: () {
                          // Acción al tocar la imagen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Registroemocion()),
                          );
                        },
                        child: Image.asset(
                            'assets/asistentes/${asistenteInfo.datosAsistente[0]['mascota']}.png'),
                      ),
                    ),
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
    );
  }
}

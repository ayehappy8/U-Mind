import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
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
    );
  }
}

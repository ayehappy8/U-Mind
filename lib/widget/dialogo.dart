import 'package:flutter/material.dart';
import 'package:pelaicons/pelaicons.dart';

class Dialogo {
  static Future<void> mostrarDialogo(BuildContext context, String title,
      String message, Function moverPagina) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Text(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    message),
                const Icon(
                    size: 90,
                    color: Colors.white,
                    Pelaicons.checked_light_outline)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                  'Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                moverPagina();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> mostrarError(BuildContext context, String title,
      String message, Function moverPagina) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Text(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    message),
                const Icon(
                    size: 90,
                    color: Colors.white,
                    Pelaicons.danger_light_outline)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                  'Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                moverPagina();
              },
            ),
          ],
        );
      },
    );
  }
}

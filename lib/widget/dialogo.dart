import 'package:flutter/material.dart';

class Dialogo {
  static Future<void> mostrarDialogo(BuildContext context, String title,
      String message, Function moverPagina) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              style: const TextStyle(color: Colors.white, fontSize: 26), title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                  style: TextStyle(color: Colors.white, fontSize: 26),
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

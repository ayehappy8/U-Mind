import 'package:flutter/material.dart';

class AsistenteInfo with ChangeNotifier {
  List<Map<String, dynamic>> _datosAsistente = [];

  List<Map<String, dynamic>> get datosAsistente => _datosAsistente;

  void setDatosAsistente(List<Map<String, dynamic>> datos) {
    _datosAsistente = datos;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class AsistenteInfo with ChangeNotifier {
  List<Map<String, dynamic>> _datosAsistente = [];

  List<Map<String, dynamic>> get datosAsistente => _datosAsistente;

  void setDatosAsistente(List<Map<String, dynamic>> datos) {
    _datosAsistente = datos;
    notifyListeners();
  }
}

class RegistroInfo with ChangeNotifier {
  List<Map<String, dynamic>> _datosRegistro = [];

  List<Map<String, dynamic>> get datosRegistro => _datosRegistro;

  void setDatosRegistro(List<Map<String, dynamic>> datos) {
    _datosRegistro = datos;
    notifyListeners();
  }
}

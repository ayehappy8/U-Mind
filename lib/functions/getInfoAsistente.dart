import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umind/usuario_auth/firebase_auth_service/getUsuario.dart';

final List<Map<String, dynamic>> _datosAsistente = <Map<String, dynamic>>[];

Future<List<Map<String, dynamic>>> getInfoAsistente() async {
  _datosAsistente.clear();
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("Usuarios").doc(getCurrentUserId());
  QuerySnapshot consultas =
      await documentReference.collection("Asistente").get();

  if (consultas.docs.isNotEmpty) {
    for (var doc in consultas.docs) {
      _datosAsistente.add(doc.data() as Map<String, dynamic>);
    }
  }
  return _datosAsistente;
}

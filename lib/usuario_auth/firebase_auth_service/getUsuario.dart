import 'package:firebase_auth/firebase_auth.dart';

String? getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  } else {
    return null; // El usuario no está autenticado
  }
}

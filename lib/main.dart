import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';
import 'providers/assistant_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const UMind());
  });
}

class UMind extends StatelessWidget {
  const UMind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AsistenteInfo()),
        ],
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.teal,
                accentColor: const Color.fromARGB(255, 154, 208, 194),
              ),
            ),
            home: const Login(),
          ),
        ));
  }
}

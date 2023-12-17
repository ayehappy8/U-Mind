import 'package:flutter/material.dart';

class Pensamiento extends StatelessWidget {
  const Pensamiento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: const Center(
          child: SingleChildScrollView(
            child: Center(
              child: Text("Pensamiento"),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:umind/screens/capsula/VideoDesp.dart';
import 'package:umind/screens/capsula/CapInfo1.dart';
import 'package:umind/screens/capsula/CapInfo2.dart';
import 'package:umind/screens/capsula/test.dart';

class Capsulas extends StatelessWidget {
  const Capsulas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 222, 202),
      body: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Row 1 - video 1 -
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 180,
                            height: 80,
                            child: Text(
                                style: TextStyle(fontSize: 10),
                                " ¿Cómo trabajar el bienestar emocional? "),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 150, 40),
                              minimumSize: const Size(107, 21),
                            ),
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                                "Video"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VideoDesp(),
                                  )),
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 125.0,
                        width: 125.0,
                        child: InkWell(
                          onTap: () {
                            // Acción al tocar la imagen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VideoDesp()),
                            );
                          },
                          child: Image.asset('assets/video.png'),
                        ),
                      ),
                    ],
                  ),
                  //Row 2 - Informacion 1 -
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 180,
                            height: 80,
                            child: Text(
                                style: TextStyle(fontSize: 10),
                                " ¿Cómo dejar de procrastrinar? "),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 230, 233, 89),
                              minimumSize: const Size(107, 21),
                            ),
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                                "Información"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CapInfo1(),
                                  )),
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 110.0,
                        width: 110.0,
                        child: InkWell(
                          onTap: () {
                            // Acción al tocar la imagen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CapInfo1()),
                            );
                          },
                          child: Image.asset('assets/info.png'),
                        ),
                      ),
                    ],
                  ),
                  //Row 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 180,
                            height: 80,
                            child: Text(
                                style: TextStyle(fontSize: 10),
                                " ¿Cómo sobrellevar el estés o la sobrecarga de trabajo? "),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 150, 40),
                              minimumSize: const Size(107, 21),
                            ),
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                                "Video"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VideoDesp(),
                                  )),
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 125.0,
                        width: 125.0,
                        child: InkWell(
                          onTap: () {
                            // Acción al tocar la imagen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VideoDesp()),
                            );
                          },
                          child: Image.asset('assets/video.png'),
                        ),
                      ),
                    ],
                  ),
                  //Row 4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 180,
                            height: 80,
                            child: Text(
                                style: TextStyle(fontSize: 10),
                                " ¿Qué es la autoconciencia? "),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 230, 233, 89),
                              minimumSize: const Size(107, 21),
                            ),
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                                "Información"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CapInfo2(),
                                  )),
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 110.0,
                        width: 110.0,
                        child: InkWell(
                          onTap: () {
                            // Acción al tocar la imagen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CapInfo2()),
                            );
                          },
                          child: Image.asset('assets/info.png'),
                        ),
                      ),
                    ],
                  ),
                  // ROW 5 TEST
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 180,
                            height: 80,
                            child: Text(
                                style: TextStyle(fontSize: 10),
                                " Test para detectar estadp mental "),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 234, 116, 77),
                              minimumSize: const Size(107, 21),
                            ),
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 10),
                                "Test"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const test(),
                                  )),
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 120.0,
                        width: 120.0,
                        child: InkWell(
                          onTap: () {
                            // Acción al tocar la imagen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const test()),
                            );
                          },
                          child: Image.asset('assets/test.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

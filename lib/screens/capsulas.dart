import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umind/providers/assistant_provider.dart';
import '/widget/card.dart';
import 'package:umind/screens/capsulas/actividades.dart';

class Capsulas extends StatelessWidget {
  const Capsulas({super.key});

  @override
  Widget build(BuildContext context) {
    final registroInfo = Provider.of<RegistroInfo>(context);
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
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color.fromARGB(255, 23, 56, 84),
                              fontSize: 24,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Tu estado hoy:'),
                            ],
                          ),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Color.fromARGB(255, 23, 56, 84),
                                fontSize: 24,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '${registroInfo.datosRegistro[0]['emocion1']}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardSelect(
                    text: '3 Consejos Para NO Procrastinar',
                    type: 'video',
                    url: 'https://www.youtube.com/watch?v=WxiWEwOeu1U',
                  ),
                  CardSelect(
                    text: 'Introducción a los trastornos de ansiedad',
                    type: 'informacion',
                    url:
                        'https://www.msdmanuals.com/es-cl/hogar/trastornos-de-la-salud-mental/ansiedad-y-trastornos-relacionados-con-el-estr%C3%A9s/introducci%C3%B3n-a-los-trastornos-de-ansiedad',
                  ),
                  CardSelect(
                    text: 'Un antídoto contra la insatisfacción',
                    type: 'video',
                    url:
                        'https://www.youtube.com/watch?v=WPPPFqsECz0&list=WL&index=29',
                  ),
                  CardSelect(
                    text: 'Como dejar de procastinar',
                    type: 'test',
                    url: '',
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      minimumSize: const Size(176, 50),
                    ),
                    child: const Text(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        "Actividades",
                        textAlign: TextAlign.center),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Actividades()))
                    },
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

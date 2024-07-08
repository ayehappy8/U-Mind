import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umind/functions/getInfo.dart';
import 'package:umind/providers/assistant_provider.dart';
import 'package:umind/screens/registro.dart';
import '/widget/card.dart';
import 'package:umind/screens/capsulas/actividades.dart';

class Capsulas extends StatefulWidget {
  const Capsulas({Key? key}) : super(key: key);

  @override
  _CapsulasState createState() => _CapsulasState();
}

bool _isLoading = true;

class _CapsulasState extends State<Capsulas> {
  Future<void> fetchInfoRegistro() async {
    List<Map<String, dynamic>> datos = await getInfoRegistro();
    Provider.of<RegistroInfo>(context, listen: false).setDatosRegistro(datos);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    fetchInfoRegistro();
  }

  @override
  Widget build(BuildContext context) {
    final registroInfo = Provider.of<RegistroInfo>(context);
    if (_isLoading == true) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 222, 202),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 550),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Color.fromARGB(255, 23, 56, 84),
                  fontSize: 24,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          'Para poder ingresar a cápsulas, por favor, ingrese su registro diario'),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
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
}

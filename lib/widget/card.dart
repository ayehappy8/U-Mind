import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardSelect extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final String type;
  final String url;

  const CardSelect({
    Key? key,
    required this.text,
    required this.type,
    required this.url,
    this.width = 350,
    this.height = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String buttonText;
    Color disabledButtonColor;

    switch (type) {
      case 'video':
        icon = Icons.play_circle_fill;
        buttonText = "Video";
        disabledButtonColor = Colors.teal[200]!;
        break;
      case 'informacion':
        icon = Icons.info;
        buttonText = "Información";
        disabledButtonColor = Colors.blue[200]!;
        break;
      case 'test':
        icon = Icons.check_circle;
        buttonText = "Test";
        disabledButtonColor = Colors.green[200]!;
        break;
      default:
        icon = Icons.help;
        buttonText = "Abrir";
        disabledButtonColor = Colors.grey[400]!;
        break;
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.teal,
      child: InkWell(
        splashColor: const Color.fromARGB(255, 24, 109, 86),
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                          height: 5), // Espacio entre el texto y el botón
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: disabledButtonColor,
                          minimumSize: const Size(107, 21),
                          disabledBackgroundColor: disabledButtonColor,
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 10,
                          ),
                        ),
                        onPressed: null, // El botón está deshabilitado
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 90.0,
                  width: 80.0,
                  child: Icon(icon, size: 50, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

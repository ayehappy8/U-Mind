import 'package:flutter/material.dart';
import '/widget/card.dart';

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
                  CardSelect(
                    text: 'Video de ejemplo',
                    type: 'video',
                    url: 'https://www.youtube.com',
                  ),
                  CardSelect(
                    text: 'Como dejar de procastinar',
                    type: 'informacion',
                    url: 'https://x.com/',
                  ),
                  CardSelect(
                    text: 'Como dejar de procastinar',
                    type: 'video',
                    url: 'https://x.com/',
                  ),
                  CardSelect(
                    text: 'Como dejar de procastinar',
                    type: 'test',
                    url: '',
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

class VideoDesp extends StatelessWidget {
  const VideoDesp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Capsula video "),
      ),
      body: const Center(),
    );
  }
}

class InfoDep extends StatelessWidget {
  const InfoDep({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Capsula información"),
      ),
      body: const Center(),
    );
  }
}

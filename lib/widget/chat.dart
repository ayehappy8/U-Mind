import 'package:flutter/material.dart';

class ChatPop extends StatelessWidget {
  final Widget content;

  const ChatPop({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 24.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: content,
                ),
              ),
            ),
          ),
          Positioned(
            right: 60,
            top: -5,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPopup extends StatefulWidget {
  @override
  _ChatPopupState createState() => _ChatPopupState();
}

class _ChatPopupState extends State<ChatPopup> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChatPop(
      content: Column(
        children: [
          // Mensajes del chat
          Expanded(
            child: Container(
              color: Colors.teal,
              child: Center(
                child: Text('Mensajes del chat'),
              ),
            ),
          ),
          // Cuadro de entrada de mensaje
          Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Lógica para enviar mensajes
                    print('Mensaje enviado: ${_messageController.text}');
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

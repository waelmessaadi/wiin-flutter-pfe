import 'package:flutter/material.dart';

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nom de la conversation'),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Action à exécuter lorsqu'on appuie sur l'icône d'appel
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                // Action à exécuter lorsqu'on appuie sur l'icône de la caméra
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Liste des messages
                // Exemple de message :
                // Message(text: 'Bonjour', isMe: true),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Action à exécuter lorsqu'on appuie sur l'icône d'ajout
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Tapez votre message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Action à exécuter lorsqu'on envoie le message
                    if (_textController.text.isNotEmpty) {
                      setState(() {
                        // Ajouter le nouveau message à la liste des messages
                        // Exemple :
                        // messages.add(Message(text: _textController.text, isMe: true));
                        // Effacer le texte dans le TextField
                        _textController.text = '';
                      });
                    }
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

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

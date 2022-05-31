import 'package:flutter/material.dart';
import 'main.dart';
import 'page1.dart';
import 'custom_theme.dart';

//это второй экран
class DetailScreenWidget extends StatefulWidget {
  const DetailScreenWidget({Key? key}) : super(key: key);

  @override
  _DetailScreenWidgetState createState() => _DetailScreenWidgetState();
}

TextEditingController _textFieldController = TextEditingController();

void _sendDataBack(BuildContext context) {
  String textToSendBack = _textFieldController.text;
  Navigator.pop(context, textToSendBack);
}

//тело второго экрана, с кнопкой удаления
class _DetailScreenWidgetState extends State<DetailScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                removeItem(a);
                _sendDataBack(context);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _inputField(),
      ),
    );
  }

  //поле ввода: если ввести новый элемент списка, то старый удалится и заменится на новый
  Widget _inputField() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: TextField(
          controller: _textFieldController,
          textAlign: TextAlign.center,
          decoration: InputDecoration.collapsed(hintText: ideas.elementAt(a)),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          onSubmitted: (String text) {
            setState(() {
              removeItem(a);
              ideas.add(text);
              _sendDataBack(context);
              _textFieldController.clear();
            });
          },
        ),
      ),
    );
  }
}

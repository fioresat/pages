import 'package:flutter/material.dart';
import 'main.dart';
import 'page2.dart';
import 'custom_theme.dart';

//это первый экран
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController _controller = TextEditingController();

  //тело первого экрана
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _title(),
                _inputWindow(),
                _buildPanel(),
              ]),
        ),
      ),
    );
  }

  //здесь вводим идеи
  Widget _inputWindow() {
    return Container(
      width: 300,
      height: 50,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.center,
        decoration: const InputDecoration.collapsed(hintText: "Идея"),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        onSubmitted: (String text) {
          setState(() {
            ideas.add(text);
            _controller.clear();
          });
        },
      ),
    );
  }

  //здесь просто текст Гениальные идеи
  Widget _title() {
    return const Text(
      'Гениальные идеи:',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      textAlign: TextAlign.center,
    );
  }

  //сюда передаётся список наших идей, создается ListView и идеи помещаются в карточки
  //onTap происходит присвоение переменной a текущего индекса и вызывается функция _awaitReturnValueFromSecondScreen
  Widget _buildPanel() {
    return ListView.builder(
      itemCount: ideas.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              a = index;
              _awaitReturnValueFromSecondScreen(context);
            },
            leading: const Icon(Icons.auto_awesome),
            title: Text(
              ideas.elementAt(index),
              style: const TextStyle(fontSize: 22),
            ),
          ),
        );
      },
      shrinkWrap: true,
    );
  }

  //функция отправляет нас на второй экран и ждёт, что вернётся
  //если возвращается не пустая String, то добавляем результат в Set
  //если пустая, то ничего не добавляем
  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreenWidget(),
        ));
    setState(() {
      if (!result.isEmpty) {
        ideas.add(result);
      }
    });
  }
}

import 'package:flutter/material.dart';

class TelaDePesquisa extends StatefulWidget {
  const TelaDePesquisa({super.key});

  @override
  _TelaDePesquisaState createState() => _TelaDePesquisaState();
}

class _TelaDePesquisaState extends State<TelaDePesquisa> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 32.0),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Pesquisar",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
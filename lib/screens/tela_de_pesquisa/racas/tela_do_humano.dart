import 'package:flutter/material.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_de_racas.dart';

class TelaDoHumano extends StatefulWidget {
  const TelaDoHumano({Key? key}) : super(key: key);

  @override
  TelaDoHumanoState createState() => TelaDoHumanoState();
}

class TelaDoHumanoState extends State<TelaDoHumano> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 32),
              Row(
                children: const <Widget>[
                  IconeDoApp(),
                  SizedBox(width: 16),
                  BotaoDeVoltar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

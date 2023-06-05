import 'package:flutter/material.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_de_racas.dart';

class TelaDoElfo extends StatefulWidget {
  const TelaDoElfo({Key? key}) : super(key: key);

  @override
  TelaDoElfoState createState() => TelaDoElfoState();
}

class TelaDoElfoState extends State<TelaDoElfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        margin: const EdgeInsets.all(16),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 32),
              Row(
                children: <Widget>[
                  IconeDoApp(),
                  SizedBox(width: 16),
                  BotaoDeVoltar(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BarraDeNavegacao(),
    );
  }
}

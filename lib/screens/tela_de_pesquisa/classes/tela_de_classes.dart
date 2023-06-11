import 'package:flutter/material.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/classes/tela_do_arqueiro.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/classes/tela_do_bardo.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/classes/tela_do_bruxo.dart';

class TelaDeClasses extends StatefulWidget {
  const TelaDeClasses({Key? key}) : super(key: key);

  @override
  TelaDeClassesState createState() => TelaDeClassesState();
}

class TelaDeClassesState extends State<TelaDeClasses> {
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
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Classes(
                      titulo: 'Arqueiro',
                      caminhoImagem:
                      'assets/tela_de_pesquisa/botao2_classes/classes/arqueiro.png'),
                  SizedBox(width: 8),
                  Classes(
                      titulo: 'Bardo',
                      caminhoImagem:
                      'assets/tela_de_pesquisa/botao2_classes/classes/bardo.png'),
                  SizedBox(width: 8),
                  Classes(
                      titulo: 'Bruxo',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao2_classes/classes/bruxo.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Classes extends StatelessWidget {
  const Classes({
    super.key,
    required this.titulo,
    required this.caminhoImagem,
  });

  final String titulo, caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (titulo == 'Arqueiro') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoArqueiro()),
          );
        } else if (titulo == 'Arqueiro') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoBardo()),
          );
        } else if (titulo == 'Arqueiro') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoBruxo()),
          );
        }
      },
      child: ContainerPadrao(caminhoImagem: caminhoImagem, titulo: titulo),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_do_anao.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_do_elfo.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_do_humano.dart';

class TelaDeRacas extends StatefulWidget {
  const TelaDeRacas({Key? key}) : super(key: key);

  @override
  TelaDeRacasState createState() => TelaDeRacasState();
}

class TelaDeRacasState extends State<TelaDeRacas> {
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
                  Racas(
                      titulo: 'Anão',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao1_racas/racas/anao.png'),
                  SizedBox(width: 8),
                  Racas(
                      titulo: 'Elfo',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao1_racas/racas/elf.png'),
                  SizedBox(width: 8),
                  Racas(
                      titulo: 'Humano',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao1_racas/racas/humano.png')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Racas extends StatelessWidget {
  const Racas({
    super.key,
    required this.titulo,
    required this.caminhoImagem,
  });

  final String titulo, caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (titulo == 'Anão') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoAnao()),
          );
        } else if (titulo == 'Elfo') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoElfo()),
          );
        } else if (titulo == 'Humano') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoHumano()),
          );
        }
      },
      child: ContainerPadrao(caminhoImagem: caminhoImagem, titulo: titulo),
    );
  }
}

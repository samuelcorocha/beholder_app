import 'package:flutter/material.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';

import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_do_anao.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_do_elfo.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_do_humano.dart';

class TelaDeItens extends StatefulWidget {
  const TelaDeItens({Key? key}) : super(key: key);

  @override
  TelaDeItensState createState() => TelaDeItensState();
}

class TelaDeItensState extends State<TelaDeItens> {
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
                  Itens(
                      titulo: 'Armas',
                      caminhoImagem:
                      'assets/tela_de_pesquisa/botao3_itens/itens/espada.png'),
                  SizedBox(width: 8),
                  Itens(
                      titulo: 'Vestes',
                      caminhoImagem:
                      'assets/tela_de_pesquisa/botao3_itens/itens/armaduras.png'),
                  SizedBox(width: 8),
                  Itens(
                      titulo: 'Utilidade',
                      caminhoImagem:
                      'assets/tela_de_pesquisa/botao3_itens/itens/pocao.png')
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

class Itens extends StatelessWidget {
  const Itens({
    super.key,
    required this.titulo,
    required this.caminhoImagem,
  });

  final String titulo, caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (titulo == 'Armas') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoAnao()),
          );
        } else if (titulo == 'Vestes') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDoElfo()),
          );
        } else if (titulo == 'Utilidade') {
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
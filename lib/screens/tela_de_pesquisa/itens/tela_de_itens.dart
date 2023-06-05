import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';

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
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 32),
              Row(
                children: <Widget>[
<<<<<<< Updated upstream
                  const IconeDoApp(),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TelaDePesquisa()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Voltar'),
                  ),
=======
                  IconeDoApp(),
                  SizedBox(width: 16),
                  BotaoDeVoltar(),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
>>>>>>> Stashed changes
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

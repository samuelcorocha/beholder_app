import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';

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

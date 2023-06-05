import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';

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

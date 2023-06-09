import 'package:beholder_companion/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_de_racas.dart';
import 'classes/tela_de_classes.dart';
import 'itens/tela_de_itens.dart';

class TelaDePesquisa extends StatefulWidget {
  const TelaDePesquisa({Key? key}) : super(key: key);

  @override
  TelaDePesquisaState createState() => TelaDePesquisaState();
}

class TelaDePesquisaState extends State<TelaDePesquisa> {
  final TextEditingController _textEditingController = TextEditingController();

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
              const IconeDoApp(),
              const SizedBox(height: 16),
              BarraDePesquisa(textEditingController: _textEditingController),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ItensDaPesquisa(
                      titulo: 'Classes',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao2_classes/icone_classes.png'),
                  SizedBox(width: 8),
                  ItensDaPesquisa(
                      titulo: 'Itens',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao3_itens/icone_itens.png'),
                  SizedBox(width: 8),
                  ItensDaPesquisa(
                      titulo: 'Raças',
                      caminhoImagem:
                          'assets/tela_de_pesquisa/botao1_racas/icone_racas.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BarraDePesquisa extends StatelessWidget {
  const BarraDePesquisa({
    super.key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontFamily: 'Chivo'),
      controller: _textEditingController,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Pesquisa rápida",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.5)),
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }
}

class BotaoDeVoltar extends StatelessWidget {
  const BotaoDeVoltar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontFamily: 'Chivo'),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
      icon: const Icon(Icons.arrow_back),
      label: const Text('Voltar'),
    );
  }
}

class ContainerPadrao extends StatelessWidget {
  const ContainerPadrao({
    super.key,
    required this.caminhoImagem,
    required this.titulo,
  });

  final String caminhoImagem;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 3 - 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            caminhoImagem,
            height: 64,
            width: 64,
          ),
          const SizedBox(height: 8),
          Text(
            titulo,
            style: const TextStyle(fontSize: 18, fontFamily: 'Chivo'),
          ),
        ],
      ),
    );
  }
}

class IconeDoApp extends StatelessWidget {
  const IconeDoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/tela_de_login/logo_beholder.png',
            height: 40,
          ),
        ),
      ),
    );
  }
}

class ItensDaPesquisa extends StatelessWidget {
  const ItensDaPesquisa({
    super.key,
    required this.titulo,
    required this.caminhoImagem,
  });

  final String titulo, caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (titulo == 'Raças') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDeRacas()),
          );
        } else if (titulo == 'Classes') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDeClasses()),
          );
        } else if (titulo == 'Itens') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDeItens()),
          );
        }
      },
      child: ContainerPadrao(caminhoImagem: caminhoImagem, titulo: titulo),
    );
  }
}

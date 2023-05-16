import 'package:beholder_companion/screens/profile/profile.dart';
import 'package:beholder_companion/screens/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/racas/tela_de_racas.dart';
import 'package:beholder_companion/screens/tela_de_social/tela_de_social.dart';

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
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Pesquisa rápida",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  ItensDaPesquisa(titulo: 'Raças', caminhoImagem: 'assets/tela_de_pesquisa/botao1_racas/icone_racas.png'),
                  SizedBox(width: 8),
                  ItensDaPesquisa(titulo: 'Classes', caminhoImagem: 'assets/tela_de_pesquisa/botao2_classes/icone_classes.png'),
                  SizedBox(width: 8),
                  ItensDaPesquisa(titulo: 'Itens', caminhoImagem: 'assets/tela_de_pesquisa/botao3_itens/icone_itens.png')
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

class ItensDaPesquisa extends StatelessWidget {
  const ItensDaPesquisa({
    super.key, required this.titulo, required this.caminhoImagem,
  });

  final String titulo, caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TelaDeRacas()),
        );
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width / 3 - 24,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
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
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(),
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

class BarraDeNavegacao extends StatelessWidget {
  const BarraDeNavegacao({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[800],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Container(
              height: 32,
              color: null,
              child: Image.asset("assets/barra_de_navegacao/icone_casa.png"),
            ),
            label: ''
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 32,
            color: null,
            child: Image.asset("assets/barra_de_navegacao/icone_mapa.png"),
          ),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 32,
            color: null,
            child: Image.asset("assets/barra_de_navegacao/icone_pesquisa.png"),
          ),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 32,
            color: null,
            child: Image.asset("assets/barra_de_navegacao/icone_perfil.png"),
            ),
          label: ''
        ),
        BottomNavigationBarItem(
            icon: Container(
              height: 32,
              color: null,
              child: Image.asset("assets/barra_de_navegacao/icone-jogar.png"),
            ),
            label: ''
        ),
      ],
      currentIndex: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaInicial()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaDeSocial()),
            );
            break;
          case 2:
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaDePesquisa()),
          );
          break;
        }
      },
    );
  }
}
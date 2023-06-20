import 'package:beholder_companion/screens/tela_de_social/tela_de_social.dart';
import 'package:flutter/material.dart';

import '../tela_de_pesquisa/nova_tela_de_pesquisa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
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
                child:
                Image.asset("assets/barra_de_navegacao/icone_pesquisa.png"),
              ),
              label: ''
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            TelaDeSocial(),
            NovaTelaDePesquisa(),
          ],
        ),
      ),
    );
  }
}
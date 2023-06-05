import 'package:beholder_companion/screens/tela_de_social/tela_de_social.dart';
import 'package:flutter/material.dart';

import '../tela_de_pesquisa/tela_de_pesquisa.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: const SectionNavigator(),
    );
  }
}

class SectionNavigator extends StatefulWidget {
  const SectionNavigator({super.key});

  @override
  State<SectionNavigator> createState() => _SectionNavigatorState();
}

class _SectionNavigatorState extends State<SectionNavigator>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text('Beholder de Bolso')
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.newspaper),
              text: 'Notícias',
            ),
            Tab(
              icon: Icon(Icons.chat_bubble),
                text: 'Fórum'
            ),
            Tab(
              icon: Icon(Icons.notifications),
                text: 'Notificações'
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("Sem notícias por enquanto!"),
          ),
          Center(
            child: Text("O fórum ainda não foi implementado!"),
          ),
          Center(
            child: Text("Nenhuma novidade!"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}

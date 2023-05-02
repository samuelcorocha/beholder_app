import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';

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
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TelaDeLogin()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 40,
                    ),
                  ),
                ),
              ),
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
                children: <Widget>[
                  Container(
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
                          'assets/icone_racas.png',
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Raças',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
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
                          'assets/icone_classes.png',
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Classes',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
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
                          'assets/icone_itens.png',
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Itens',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Container(
                height: 32,
                color: null,
                child: Image.asset("assets/navbar_casa.png"),
              ),
              label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 32,
              color: null,
              child: Image.asset("assets/navbar_mapa.png"),
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 32,
              color: null,
              child: Image.asset("assets/navbar_pesquisa.png"),
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 32,
              color: null,
              child: Image.asset("assets/navbar_perfil.png"),
              ),
            label: ''
          ),
        ],
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 1) { // índice do botão "Busca"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDePesquisa()),
            );
          }
        },
      ),
    );
  }
}

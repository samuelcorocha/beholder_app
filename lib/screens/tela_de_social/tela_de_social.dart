import 'package:flutter/material.dart';

import '../tela_de_pesquisa/tela_de_pesquisa.dart';
import '../tela_inicial/tela_inicial.dart';

class TelaDeSocial extends StatelessWidget{

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
              const SizedBox(height: 32),
              const Text(
                "Escolha seu próximo parceiro(a) de mesa",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Chivo',
                  fontSize: 19.0,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 64),
              Image.asset('assets/tela_de_social/axalote.png'),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Axalote - Jogador - Novato",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Chivo',
                    fontSize: 19.0,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: TextButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                  width: 0,
                                  color: Colors.transparent,
                                  style: BorderStyle.solid,
                                )),
                            shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ))),
                        onPressed: () {},
                        child: Icon(Icons.verified, color: Colors.green, size: 50),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: TextButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                  width: 0,
                                  color: Colors.transparent,
                                  style: BorderStyle.solid,
                                )),
                            shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ))),
                        onPressed: () {},
                        child: Icon(Icons.cancel, color: Colors.red, size: 50),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
          ]
          )
        )
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
                child: Image.asset("assets/barra_de_navegacao/icone_jogar.png"),
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
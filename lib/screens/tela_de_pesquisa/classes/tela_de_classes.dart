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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 32),
              Row(
                children: <Widget>[
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:beholder_companion/screens/tela_de_pesquisa/nova_tela_de_pesquisa.dart';
import 'package:flutter/material.dart';

class TelaDeOutros extends StatefulWidget {
  const TelaDeOutros ({Key? key}) : super(key: key);

  @override
  TelaDeOutrosState createState() => TelaDeOutrosState();
}

class TelaDeOutrosState extends State<TelaDeOutros> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BarraInferior(),
    );
  }
}
import 'package:beholder_companion/screens/tela_de_pesquisa/nova_tela_de_pesquisa.dart';
import 'package:flutter/material.dart';

class TelaDeHistorico extends StatefulWidget {
  const TelaDeHistorico ({Key? key}) : super(key: key);

  @override
  TelaDeHistoricoState createState() => TelaDeHistoricoState();
}

class TelaDeHistoricoState extends State<TelaDeHistorico> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BarraInferior(),
    );
  }
}
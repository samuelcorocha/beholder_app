import 'package:beholder_companion/screens/tela_de_pesquisa/classes/descricao_de_classe.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/classes/tela_de_classes.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/nova_tela_de_pesquisa.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NovaTelaDePesquisa(),
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Chivo'
      ),
    ),
  );
}
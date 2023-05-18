import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa//tela_de_pesquisa.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Chivo'),
      home: const TelaDeCadastro(),
      //home: TelaDePesquisa(),
      //
    ),
  );
}
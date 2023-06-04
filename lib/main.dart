import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';
import 'screens/tela_de_login/nova_tela_de_login.dart';

void main() {
  runApp(
    const MaterialApp(
      home: NovaTelaDeLogin(),
      //home: TelaDePesquisa(),
      //
    ),
  );
}
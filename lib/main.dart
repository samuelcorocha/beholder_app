import 'package:beholder_companion/screens/onBoarding/views/onboarding_screen.dart';
import 'package:beholder_companion/screens/profile/profile.dart';
import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_1.dart';
import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_2.dart';
import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa//tela_de_pesquisa.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Chivo'),
      home: const TelaDeLogin(),
    ),
  );
}

<<<<<<< HEAD
import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa//tela_de_pesquisa.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(fontFamily: 'Chivo'),
//       home: const TelaDeCadastro(),
//       //home: TelaDePesquisa(),
//       //
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
=======
import 'package:beholder_companion/screens/onBoarding/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_login/tela_de_login.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa//tela_de_pesquisa.dart';
//somente para commitar
void main() {
  runApp(
    const MaterialApp(
      home: OnBoardingScreen(),
      //home: TelaDePesquisa(),
      //
    ),
>>>>>>> 889326c36ebfd5a69b6d29cc01265709800f57bb
  );
  runApp(TestPage());
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Funcionou!')),
      ),
    );
  }
}

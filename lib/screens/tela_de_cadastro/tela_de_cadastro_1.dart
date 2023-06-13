import 'dart:math';
import 'package:beholder_companion/email/email.dart';
import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_2.dart';
import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TelaDeCadastro1 extends StatefulWidget {
  const TelaDeCadastro1({Key? key}) : super(key: key);

  @override
  TelaDeCadastro1State createState() => TelaDeCadastro1State();
}

class TelaDeCadastro1State extends State<TelaDeCadastro1> {
  final firebaseApp = Firebase.app();
  late final rtdb;

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordConfirm = new TextEditingController();

  late final tokenId;

  Future<void> send () async {
    final ref = FirebaseDatabase.instance.ref();

    final result = await ref.child("users").get();
    final keys = result.value != null ? (result.value as Map).keys.cast<String>() : <String>[];

    final maxNumber = keys.isEmpty ? 0 : keys.map<int>((key) => int.tryParse(key) ?? 0).reduce(max);

    DatabaseReference userRef = FirebaseDatabase.instance.ref("users/${maxNumber + 1}");

    await userRef.set({
      "username": username.text,
      "email": email.text,
      "password": password.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 16,top: 8,right: 16,bottom: 16),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const Text(
                "Crie uma conta Beholder agora mesmo!",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              CampoDeLoginVisivel(textoSuperior: 'Nome de usuário', emailAddress: username),
              const SizedBox(height: 16.0),
              CampoDeLoginVisivel(textoSuperior: 'Email', emailAddress: email),
              const SizedBox(height: 16.0),
              CampoDeLoginInvisivel(textoSuperior: 'Senha', password: password),
              const SizedBox(height: 16.0),
              CampoDeLoginInvisivel(textoSuperior: 'Confirmar senha', password: passwordConfirm),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  send();
                  tokenId = await sendEmail(username.text, email.text);
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TelaDeCadastro2(tokenId: tokenId)));

                },
                style: ElevatedButton.styleFrom(
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                    backgroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 20.0)),
                child: const Text("Confirmar"),
              ),
              const SizedBox(height: 12.0),
              Image.asset('assets/tela_de_cadastro/cadastro_1/gato.png'),
            ]),
          ),
        ),
      )
    );
  }
}

class CampoDeCadastroVisivel extends StatelessWidget {
  const CampoDeCadastroVisivel({super.key, required this.textoSuperior});

  final String textoSuperior;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          textoSuperior,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 50,
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ]);
  }
}

class CampoDeCadastroInvisivel extends StatefulWidget {
  const CampoDeCadastroInvisivel({
    super.key,
    required this.textoSuperior,
  });

  final String textoSuperior;

  @override
  State<CampoDeCadastroInvisivel> createState() =>
      _CampoDeCadastroInvisivelState(textoSuperior: textoSuperior);
}

class _CampoDeCadastroInvisivelState extends State<CampoDeCadastroInvisivel> {
  _CampoDeCadastroInvisivelState({
    required this.textoSuperior,
  });

  final String textoSuperior;
  bool passwordObscured = false;

  @override
  void initState() {
    super.initState();
    passwordObscured = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          textoSuperior,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 50,
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: !passwordObscured,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                passwordObscured ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                setState(() {
                  passwordObscured = !passwordObscured;
                });
              },
            ),
          ),
        ),
      )
    ]);
  }
}

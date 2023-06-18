import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaDeCadastro2 extends StatefulWidget {

  const TelaDeCadastro2({Key? key}) : super(key: key);

  @override
  TelaDeCadastro2State createState() => TelaDeCadastro2State();
}

class TelaDeCadastro2State extends State<TelaDeCadastro2> {

  /*Future<bool> verifyToken () async {
    final ref = FirebaseDatabase.instance.ref();

    final tokenRef = await ref.child("tokens/${widget.tokenId + 1}/token").get();

    if (_verificationCode.text == tokenRef.value) {
      return true;
    } else {
      print(tokenRef.value);
      return false;
    }

  }*/

    Future<void> isEmailVerified() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? currentUser = auth.currentUser;
      await currentUser?.reload();
      if(auth.currentUser!.emailVerified) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDeCadastro3()));
      }
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
            padding: const EdgeInsets.only(left: 32,top: 32,right: 32,bottom: 60),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Antes de continuar, é necessário confirmar o seu email.\n\n"),
                      TextSpan(text: "Enviamos um email de confirmação para você!\n"),
                    ]
                  )
                ),
                const SizedBox(height: 36.0),
                ElevatedButton(
                  onPressed: () async {
                    isEmailVerified();
                  },
                  style: ElevatedButton.styleFrom(
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      backgroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20.0)),
                  child: const Text("Confirmar"),
                ),
                const SizedBox(height: 36.0),
                Image.asset('assets/tela_de_cadastro/cadastro_2/seis_dados.png'),
              ]),
            ),
          ),
        ));
  }
}

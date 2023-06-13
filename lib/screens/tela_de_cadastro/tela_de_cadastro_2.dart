import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_3.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_1.dart';

class TelaDeCadastro2 extends StatefulWidget {
  final tokenId;

  const TelaDeCadastro2({Key? key, required this.tokenId}) : super(key: key);

  @override
  TelaDeCadastro2State createState() => TelaDeCadastro2State();
}

class TelaDeCadastro2State extends State<TelaDeCadastro2> {

  TextEditingController _verificationCode = new TextEditingController();

  Future<bool> verifyToken () async {
    final ref = FirebaseDatabase.instance.ref();

    final tokenRef = await ref.child("tokens/${widget.tokenId + 1}/token").get();

    if (_verificationCode.text == tokenRef.value) {
      return true;
    } else {
      print(tokenRef.value);
      return false;
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
                      TextSpan(text: "Digite abaixo o token que você recebeu no seu email:\n"),
                    ]
                  )
                ),
                const SizedBox(height: 20.0),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    _verificationCode.text = verificationCode;
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Código de verificação"),
                            content: Text('O código digitado foi: $verificationCode'),
                          );
                        }
                    );
                  }, // end onSubmit
                ),
                const SizedBox(height: 36.0),
                ElevatedButton(
                  onPressed: () async {
                    if(await verifyToken()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TelaDeCadastro3()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: const Text("Código de verificação"),
                              content: Text('O código digitado está incorreto!'),
                            );
                          }
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
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

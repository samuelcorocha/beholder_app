import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_1.dart';
import 'package:page_transition/page_transition.dart';

class TelaDeCadastro2 extends StatefulWidget {
  const TelaDeCadastro2({Key? key}) : super(key: key);

  @override
  TelaDeCadastro2State createState() => TelaDeCadastro2State();
}

class TelaDeCadastro2State extends State<TelaDeCadastro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black)
        ),
      ),
      body: Padding(
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
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    }
                );
              }, // end onSubmit
            ),
            const SizedBox(height: 36.0),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                PageTransition(
                  child: const TelaDeCadastro3(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300)
                )
              ),
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
      )
    );
  }
}

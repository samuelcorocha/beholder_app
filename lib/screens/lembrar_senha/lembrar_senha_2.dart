import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'lembrar_senha_1.dart';
import 'lembrar_senha_3.dart';

class TelaDeLembrarSenha2 extends StatefulWidget {

  final MaterialColor colorPalette;

  const TelaDeLembrarSenha2({Key? key, required this.colorPalette}) : super(key: key);

  @override
  State<TelaDeLembrarSenha2> createState() => _TelaDeLembrarSenha2State();
}

class _TelaDeLembrarSenha2State extends State<TelaDeLembrarSenha2> {
  TextEditingController email = new TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 39.0, vertical: 32.0),
        child: SingleChildScrollView(
          child: Container(
            height: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Recuperar senha e usuário",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: 221,
                    height: 252,
                    child: Image(
                      image: AssetImage("assets/lembrar_senha/urso_coruja.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    "Digite abaixo o token que enviamos no seu e-mail",
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: OtpTextField(
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
                              title: const Text("Código de verificação"),
                              content: Text('O código digitado foi: $verificationCode'),
                            );
                          }
                      );
                    }, // end onSubmit
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Reenviar token",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                  ),
                ),
                Spacer(),
                BotaoDeConfirmar(tela: TelaDeLembrarSenha3(colorPalette: widget.colorPalette)),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}


import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaDeLembrarSenha extends StatefulWidget {

  final MaterialColor colorPalette;

  const TelaDeLembrarSenha({Key? key, required this.colorPalette}) : super(key: key);

  @override
  State<TelaDeLembrarSenha> createState() => _TelaDeLembrarSenhaState();
}

class _TelaDeLembrarSenhaState extends State<TelaDeLembrarSenha> {
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
                  "Digite seu email para redefinir sua senha",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 275,
                  height: 298,
                  child: Image(
                    image: AssetImage("assets/lembrar_senha/imagem_dados.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
                CampoDeLoginVisivel(textoSuperior: "Email", emailAddress: email),
                Spacer(),
                Text(
                  "Enviamos um email para você!",
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                BotaoDeConfirmar(tela: NovaTelaDeLogin(colorPalette: widget.colorPalette), email: email),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class BotaoDeConfirmar extends StatelessWidget {

  BotaoDeConfirmar({
    super.key, required this.tela, required this.email
  });

  TextEditingController email;
  final Widget tela;

  Future<bool> resetPassword() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.sendPasswordResetEmail(email: email.text);
      return true;
    } catch (e) {
      print(email.text);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 44,
      child: ElevatedButton(
        onPressed: () async {
          if(await resetPassword()) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
          } else {
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: const Text("Erro"),
                    content: Text("Falha ao enviar email! Tente novamente"),
                  );
                }
            );
          }
        },
        style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            backgroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Confirmar"),
            Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      ),
    );
  }
}

class BotaoDeConfirmarRota extends StatelessWidget {

  const BotaoDeConfirmarRota({
    super.key, required this.rota
  });

  final String rota;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 44,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, rota, (route) => false);
        },
        style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            backgroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Confirmar"),
            Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      ),
    );
  }
}

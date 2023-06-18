import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'lembrar_senha_1.dart';

class TelaDeLembrarSenha4 extends StatefulWidget {

  final MaterialColor colorPalette;

  const TelaDeLembrarSenha4({Key? key, required this.colorPalette}) : super(key: key);

  @override
  State<TelaDeLembrarSenha4> createState() => _TelaDeLembrarSenha4State();
}

class _TelaDeLembrarSenha4State extends State<TelaDeLembrarSenha4> {
  TextEditingController user = new TextEditingController();

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 65.0),
                  child: Text(
                    "Alteração de usuário",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: CampoDeDadosEstaticoVisivel(textoSuperior: "Nome de usuário atual", user: "Nada"),
                ),
                CampoDeLoginVisivel(textoSuperior: "Novo nome de usuário", emailAddress: user),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: SizedBox(
                    width: 315,
                    height: 225,
                    child: Image(
                      image: AssetImage("assets/lembrar_senha/dragao_dados.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Spacer(),
                BotaoDeConfirmarRota(rota: '/Login'),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class CampoDeDadosEstaticoInvisivel extends StatefulWidget {
  CampoDeDadosEstaticoInvisivel({
    super.key,
    required this.textoSuperior,
    required this.password
  });

  final String textoSuperior;
  final String password;

  @override
  State<CampoDeDadosEstaticoInvisivel> createState() =>
      _CampoDeDadosEstaticoInvisivelState(textoSuperior: textoSuperior, password: password);
}

class _CampoDeDadosEstaticoInvisivelState extends State<CampoDeDadosEstaticoInvisivel> {
  _CampoDeDadosEstaticoInvisivelState({
    required this.textoSuperior,
    required this.password
  });

  final String textoSuperior;
  final String password;

  bool passwordObscured = false;

  @override
  void initState() {
    super.initState();
    passwordObscured = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            textoSuperior,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      TextFormField(
        readOnly: true,
        initialValue: password,
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
      )
    ]);
  }
}

class CampoDeDadosEstaticoVisivel extends StatelessWidget {
  CampoDeDadosEstaticoVisivel({super.key, required this.textoSuperior, required this.user});

  final String textoSuperior;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            textoSuperior,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      TextFormField(
        enabled: false,
        initialValue: user,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}

class BotaoBranco extends StatelessWidget {
  final MaterialColor colorPalette = const MaterialColor(
    0xFF0000FF,
    <int, Color>{
      50: Color(0xFFD72638),
      100: Color(0xFFE05260),
      200: Color(0xFF9C1C28),
      300: Color(0xFF463239),
      400: Color(0xFFEFE7E9),
      500: Color(0xFF000000),
      600: Color(0xFFDFDFDF),
      700: Color(0xFFEAEAEA),
      800: Color(0xFFFAFAFA),
      900: Color(0xFFFFFFFF),
      1000: Color(0x8C000000),
    },
  );

  const BotaoBranco({
    super.key, required this.tela, required this.texto, this.largura, this.altura
  });

  final String texto;
  final double? largura;
  final double? altura;
  final Widget tela;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura ?? 150,
      height: altura ?? 44,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tela));
        },
        style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            side: BorderSide(color: colorPalette.shade500),
            backgroundColor: colorPalette.shade600,
            textStyle: const TextStyle(fontSize: 20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto,
            style: Theme.of(context).textTheme.displayMedium),
            Icon(Icons.arrow_forward, color: colorPalette.shade500)
          ],
        ),
      ),
    );
  }
}


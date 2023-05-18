import 'package:flutter/material.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({Key? key}) : super(key: key);

  @override
  TelaDeCadastroState createState() => TelaDeCadastroState();
}

class TelaDeCadastroState extends State<TelaDeCadastro> {
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
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const Text(
                "Crie uma conta Beholder agora mesmo!",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48.0),
              const CampoDeCadastroVisivel(textoSuperior: 'Nome de usuário'),
              const SizedBox(height: 16.0),
              const CampoDeCadastroVisivel(textoSuperior: 'Email'),
              const SizedBox(height: 16.0),
              const CampoDeCadastroInvisivel(textoSuperior: 'Senha'),
              const SizedBox(height: 16.0),
              const CampoDeCadastroInvisivel(textoSuperior: 'Confirmar senha'),
              const SizedBox(height: 24.0),
              const BotaoDeConfirmar(),
              const SizedBox(height: 12.0),
              Image.asset('assets/tela_de_cadastro/cadastro_2/gato.png'),
            ]),
          ),
        ));
  }
}

class BotaoDeConfirmar extends StatelessWidget {
  const BotaoDeConfirmar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TelaDeCadastro()));
      },
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          backgroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 20.0)),
      child: const Text("Confirmar"),
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
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
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
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      TextFormField(
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

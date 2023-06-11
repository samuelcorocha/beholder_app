import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TelaDeCadastro1 extends StatefulWidget {
  const TelaDeCadastro1({Key? key}) : super(key: key);

  @override
  TelaDeCadastro1State createState() => TelaDeCadastro1State();
}

class TelaDeCadastro1State extends State<TelaDeCadastro1> {
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
              const CampoDeCadastroVisivel(textoSuperior: 'Nome de usuário'),
              const SizedBox(height: 16.0),
              const CampoDeCadastroVisivel(textoSuperior: 'Email'),
              const SizedBox(height: 16.0),
              const CampoDeCadastroInvisivel(textoSuperior: 'Senha'),
              const SizedBox(height: 16.0),
              const CampoDeCadastroInvisivel(textoSuperior: 'Confirmar senha'),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TelaDeCadastro2()));
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

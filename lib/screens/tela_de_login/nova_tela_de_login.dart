import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';
import 'package:flutter/material.dart';

class NovaTelaDeLogin extends StatefulWidget {
  const NovaTelaDeLogin({Key? key}) : super(key: key);

  @override
  NovaTelaDeLoginState createState() => NovaTelaDeLoginState();
}

class NovaTelaDeLoginState extends State<NovaTelaDeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 48.0, right: 16.0, bottom: 16.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset(
                    'assets/tela_de_login/logo_beholder.png',
                    color: Colors.red,
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      Text('Beholder',
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                      Text('Companion',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const Column(
              children: [
                CampoDeLoginVisivel(textoSuperior: 'Nome de usuário'),
                SizedBox(height: 16.0),
                CampoDeLoginInvisivel(textoSuperior: 'Senha'),
              ],
            ),
            const SizedBox(height: 24.0),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(
                        fontFamily: 'Chivo', fontSize: 18, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Esqueceu seu usuário ou senha?\n"),
                      TextSpan(
                          text: "Clique aqui.",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ])),
            const SizedBox(height: 16.0),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NovaTelaDeLogin()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Image.asset(
                            'assets/tela_de_login/logo_beholder.png',
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Text('Continuar com conta Beholder'),
                        const Spacer(),
                        const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NovaTelaDeLogin()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Image.asset(
                            'assets/tela_de_login/metodos_de_login/logo_google.png',
                          ),
                        ),
                        const Spacer(),
                        const Text('Continuar com o Google'),
                        const Spacer(),
                        const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NovaTelaDeLogin()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Image.asset(
                            'assets/tela_de_login/metodos_de_login/logo_facebook.png',
                          ),
                        ),
                        const Spacer(),
                        const Text('Continuar com o Facebook'),
                        const Spacer(),
                        const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(
                        fontFamily: 'Chivo', fontSize: 18, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Não tem uma conta?\n"),
                      TextSpan(
                          text: "Registre-se.",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ])),
          ]),
        ),
      ),
    );
  }
}

class BotaoDeLogin extends StatelessWidget {
  const BotaoDeLogin(
      {super.key, required this.caminhoImagem, required this.texto});

  final String caminhoImagem;
  final String texto;

  static const nomeRota = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NovaTelaDeLogin()),
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(caminhoImagem),
            ),
            const Spacer(),
            Text(texto),
            const Spacer(),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}

class CampoDeLoginInvisivel extends StatefulWidget {
  const CampoDeLoginInvisivel({
    super.key,
    required this.textoSuperior,
  });

  final String textoSuperior;

  @override
  State<CampoDeLoginInvisivel> createState() =>
      _CampoDeLoginInvisivelState(textoSuperior: textoSuperior);
}

class _CampoDeLoginInvisivelState extends State<CampoDeLoginInvisivel> {
  _CampoDeLoginInvisivelState({
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

class CampoDeLoginVisivel extends StatelessWidget {
  const CampoDeLoginVisivel({super.key, required this.textoSuperior});

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
      TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}

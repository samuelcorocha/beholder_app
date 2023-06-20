import 'package:beholder_companion/screens/home/home.dart';
import 'package:beholder_companion/screens/lembrar_senha/lembrar_senha_1.dart';
import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NovaTelaDeLogin extends StatefulWidget {
  final MaterialColor colorPalette;

  const NovaTelaDeLogin({Key? key, required this.colorPalette}) : super(key: key);

  @override
  NovaTelaDeLoginState createState() => NovaTelaDeLoginState();
}

class NovaTelaDeLoginState extends State<NovaTelaDeLogin> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  bool _isButtonPressed = false;
  bool _isCheckboxChecked = false;
  String message = "";
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  void updateMessage(String men) {
    setState(() {
      message = men;
    });
  }

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
            Column(
              children: [
                CampoDeLoginVisivel(textoSuperior: 'Nome de usuário', emailAddress: emailAddress,),
                const SizedBox(height: 16.0),
                CampoDeLoginInvisivel(textoSuperior: 'Senha', password: password),
              ],
            ),
            const SizedBox(height: 24.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Chivo',
                fontSize: 13.0,
                color: Colors.red,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaDeLembrarSenha(colorPalette: widget.colorPalette)),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Chivo', fontSize: 16, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Esqueceu seu usuário ou senha?\n"),
                      TextSpan(
                        text: "Clique aqui.",
                        style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)
                      ),
                    ]
                  )
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailAddress.text,
                          password: password.text,
                        );
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User ? user) {
                          if (user == null) {
                            updateMessage("Problema de autenticação!");
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Home()),
                            );
                          }
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          updateMessage("Usuário não encontrado!");
                        } else if (e.code == 'wrong-password') {
                          updateMessage("Senha incorreta!");
                        } else {
                          updateMessage("Erro de login!");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: widget.colorPalette.shade500,
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
                            builder: (context) => NovaTelaDeLogin(colorPalette: widget.colorPalette)),
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
                        MaterialPageRoute(builder: (context) => NovaTelaDeLogin(colorPalette: widget.colorPalette)),
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
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaDeCadastro1()),
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Chivo',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Não tem uma conta?\n"),
                    TextSpan(
                      text: "Registre-se.",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class BotaoDeLogin extends StatelessWidget {
  final MaterialColor colorPalette;

  const BotaoDeLogin(
      {super.key, required this.caminhoImagem, required this.texto, required this.colorPalette});

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
            MaterialPageRoute(builder: (context) => NovaTelaDeLogin(colorPalette: colorPalette,)),
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
    required this.password
  });

  final String textoSuperior;
  final TextEditingController password;

  @override
  CampoDeLoginInvisivelState createState() => CampoDeLoginInvisivelState();
}

class CampoDeLoginInvisivelState extends State<CampoDeLoginInvisivel> {

  bool passwordObscured = false;
  TextEditingController password = TextEditingController();

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
          widget.textoSuperior,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.text,
        obscureText: !passwordObscured,
        controller: password,
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
  CampoDeLoginVisivel({
    super.key,
    required this.textoSuperior,
    required this.emailAddress
  });

  final String textoSuperior;
  final TextEditingController emailAddress;

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
        controller: emailAddress,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}

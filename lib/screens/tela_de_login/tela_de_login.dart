import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_1.dart';
import 'package:flutter/material.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/tela_de_pesquisa.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({Key? key}) : super(key: key);

  @override
  TelaDeLoginState createState() => TelaDeLoginState();
}

class TelaDeLoginState extends State<TelaDeLogin> {

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
    final screenHeight = MediaQuery.of(context).size.height;
    final slideUpHeight = screenHeight * 0.7;

    return Scaffold(
        body: GestureDetector(
        onTap: () {
          setState(() {
            _isButtonPressed = false;
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/tela_de_login/fundo_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isButtonPressed = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _isButtonPressed ? slideUpHeight : 0,
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: _isButtonPressed ? 16 : 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Bem-vindo(a) de volta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        controller: password,
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                        ),
                      ),
                      const SizedBox(height: 16),
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
                      Row(
                        children: [
                          Checkbox(
                            value: _isCheckboxChecked,
                            onChanged: (newValue) {
                              setState(() {
                                _isCheckboxChecked = newValue!;
                              });
                            },
                          ),
                          const Text('Salvar informações de login'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                            },
                            child: const Text(
                              ' Clique aqui',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
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
                                  MaterialPageRoute(builder: (context) => const TelaDePesquisa()),
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
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                        ),
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            child: Image.asset(
                              'assets/tela_de_login/metodos_de_login/logo_facebook.png',
                              height: 48,
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            child: Image.asset(
                              'assets/tela_de_login/metodos_de_login/logo_google.png',
                              height: 48,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Não tem uma conta? ',
                            style: TextStyle(
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TelaDeCadastro1())
                              );
                            },
                            child: const Text(
                              'Registre-se',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
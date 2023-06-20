import 'dart:core';
import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_2.dart';
import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaDeCadastro1 extends StatefulWidget {
  const TelaDeCadastro1({Key? key}) : super(key: key);

  @override
  TelaDeCadastro1State createState() => TelaDeCadastro1State();
}

class TelaDeCadastro1State extends State<TelaDeCadastro1> {
  final firebaseApp = Firebase.app();
  late final rtdb;

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordConfirm = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  late final tokenId;

  /*Future<void> send () async {
    final ref = FirebaseDatabase.instance.ref();

    final result = await ref.child("users").get();
    final keys = result.value != null ? (result.value as Map).keys.cast<String>() : <String>[];

    final maxNumber = keys.isEmpty ? 0 : keys.map<int>((key) => int.tryParse(key) ?? 0).reduce(max);

    DatabaseReference userRef = FirebaseDatabase.instance.ref("users/${maxNumber + 1}");

    await userRef.set({
      "username": username.text,
      "email": email.text,
      "password": password.text,
    });
  }*/

  Future<bool?> checkUser(String username) async {
    final ref = FirebaseDatabase.instance.ref();
    bool check = true;
    await ref.child("users").get().then((search) {
      for (final data in search.children) {
        //print(data.child("user").value);
        if(data.child("user").value == username) {
          check = false;
        }
      }
    });
    return check;
  }

  Future<bool?> checkEmail(String email) async {
    final ref = FirebaseDatabase.instance.ref();
    bool check = true;
    await ref.child("users").get().then((search) {
      for (final data in search.children) {
        //print(data.child("email").value);
        if(data.child("email").value == email) {
          check = false;
        }
      }
    });
    return check;
  }

  Future<int?> send() async {
    if(email.text != "" || password.text != "" || passwordConfirm.text != "" || username.text != "") {
      if(password.text == passwordConfirm.text) {
        if(await checkUser(username.text) == true) {
          if(await checkEmail(email.text) == true) {
            FirebaseAuth auth = FirebaseAuth.instance;
            UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
            String emailFormated = email.text.substring(0, email.text.indexOf('@'));
            final ref = FirebaseDatabase.instance.ref("users/${emailFormated}");
            await ref.update({
              "username": username.text,
              "email": email.text,
            });

            User? user = userCredential.user;
            print(user.toString());
            if (user != null) {
              try {
                await user.sendEmailVerification();
                print("E-mail de verificação enviado para ${user.email}");
              } catch (e) {
                print("Erro ao enviar e-mail de verificação: $e");
              }
            }
            return 1;
          } else {
            return 2;
          }
        } else {
          return 3;
        }
      } else {
        return 4;
      }
    } else {
      return 5;
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
          padding: const EdgeInsets.only(left: 16,top: 8,right: 16,bottom: 16),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const Text(
                "Crie uma conta Beholder agora mesmo!",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              CampoDeLoginVisivel(textoSuperior: 'Nome de usuário', emailAddress: username),
              const SizedBox(height: 16.0),
              CampoDeLoginVisivel(textoSuperior: 'Email', emailAddress: email),
              const SizedBox(height: 16.0),
              CampoDeLoginInvisivel(textoSuperior: 'Senha', password: password),
              const SizedBox(height: 16.0),
              CampoDeLoginInvisivel(textoSuperior: 'Confirmar senha', password: passwordConfirm),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  String mensagem = "";
                  int? code = await send();
                  if(code == 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDeCadastro2()));
                  } else if (code == 2) {
                    mensagem = "Email já cadastrado no sistema";
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Erro"),
                            content: Text(mensagem),
                          );
                        }
                    );
                  } else if (code == 3) {
                    mensagem = "Nome de usuario já em uso";
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Erro"),
                            content: Text(mensagem),
                          );
                        }
                    );
                  } else if (code == 4) {
                    mensagem = "As senhas são diferentes";
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Erro"),
                            content: Text(mensagem),
                          );
                        }
                    );
                  } else {
                    mensagem = "Um ou mais campos vazios";
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Erro"),
                            content: Text(mensagem),
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
                child: const Text("Confirmar"),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 54.0),
                child: Image.asset('assets/tela_de_cadastro/cadastro_1/gato.png'),
              ),
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
      _CampoDeCadastroInvisivelState();
}

class _CampoDeCadastroInvisivelState extends State<CampoDeCadastroInvisivel> {

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
          widget.textoSuperior,
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

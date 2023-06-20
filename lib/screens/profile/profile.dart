import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../tela_inicial/tela_inicial.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController email = new TextEditingController();

  User? getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  String _email = '';
  String _nickname = "Arthur";
  String _username = "arthur";
  String _follows = "0";
  String _followers = "1000000";
  String _masterLevel = "1000000";
  String _playerLevel = "1000000";
  String _systemsCount = "3";
  String _tablesCount = "4";
  String _charsCount = "5";

  getUserInfo() {
    User? currentUser = getCurrentUser();
    if (currentUser != null) {
      String uid = currentUser.uid;
      _email = currentUser.email.toString();

      print('UID: $uid');
      print('EMAIL: $_email');
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserInfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaInicial()),
              );
            },
            icon: const Icon(Icons.arrow_back_sharp, color: Color(0xff000000))),
        title:
            const Text('Profile', style: TextStyle(color: Color(0xff000000))),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/profile/profilepic.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: IconButton(
                                onPressed: () {
                                  // Lógica do botão de edição
                                },
                                icon: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: IconButton(
                                onPressed: () {
                                  // Lógica do botão de edição
                                },
                                icon: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    child: Text(
                      _nickname,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton(
                          onPressed: () {
                            // Lógica do botão de edição
                          },
                          icon: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                              const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Text(
                        '@$_username',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // use whichever suits your need
                  children: <Widget>[
                    Text("Seguidores: $_followers"),
                    Text("Seguindo: $_follows"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 350,
                child: Row(
                  children: <Widget>[
                    Text("20 anos, nerd e otaku fedido "),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book),
                    SizedBox(
                      width: 30,
                    ),
                    Text("Mestre Nível $_masterLevel")
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    SizedBox(
                      width: 30,
                    ),
                    Text("Mestre Nível $_playerLevel")
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      Colors.black, // Define a cor do texto como branco
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 50.0,
                  ), // Define o espaçamento interno do botão
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // Define o raio do botão
                  ),
                ),
                onPressed: () {
                  // Ação ao pressionar o botão
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Seguir',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                        width:
                            8.0), // Define um espaçamento entre o texto e o símbolo "+"
                    Icon(Icons.add),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  "Sistemas ($_systemsCount)",
                ),
              ),
              Container(
                height: 110,
                width: 350,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  "Sistemas ($_tablesCount)",
                ),
              ),
              Container(
                height: 110,
                width: 350,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  "Sistemas ($_charsCount)",
                ),
              ),
              Container(
                height: 110,
                width: 350,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}

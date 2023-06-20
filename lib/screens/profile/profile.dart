import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final String _nickname = "Arthur";
  final String _username = "arthur";
  final String _follows = "0";
  final String _followers = "1000000";
  final String _masterLevel = "1000000";
  final String _playerLevel = "1000000";
  final String _systemsCount = "3";
  final String _tablesCount = "4";
  final String _charsCount = "5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp, color: Color(0xff000000))),
        title:
          const Text('Profile', style: TextStyle(color: Color(0xff000000))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
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
                const SizedBox(width: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 50),
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
                const SizedBox(height: 20),
                Container(
                  height: 75,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Seguidores: $_followers",
                            style: const TextStyle(
                              fontFamily: 'Chivo',
                              fontSize: 18
                            )
                          ),
                          Text(
                            "Seguindo: $_follows",
                            style: const TextStyle(
                              fontFamily: 'Chivo',
                              fontSize: 18
                            )
                          ),
                        ],
                      ),
                      const Text(
                        "Sobre mim: 20 anos, nerd e otaku fedido.",
                        style: TextStyle(
                          fontFamily: 'Chivo',
                          fontSize: 18
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.book),
                          Text(
                            "Nível de Mestre $_masterLevel",
                            style: const TextStyle(
                              fontFamily: 'Chivo',
                              fontSize: 18
                            )
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.play_arrow),
                          Text(
                            "Nível de Jogador: $_playerLevel",
                            style: const TextStyle(
                              fontFamily: 'Chivo',
                              fontSize: 18
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 50.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Seguir',
                        style: TextStyle(fontFamily: 'Chivo', fontSize: 16)
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Sistemas ($_systemsCount)",
                            style: const TextStyle(fontFamily: 'Chivo', fontSize: 16)
                          ),
                          Container(
                            height: 110,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Sistemas ($_tablesCount)",
                            style: const TextStyle(fontFamily: 'Chivo', fontSize: 16)
                          ),
                          Container(
                            height: 110,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Sistemas ($_charsCount)",
                            style: const TextStyle(fontFamily: 'Chivo', fontSize: 16)
                          ),
                          Container(
                            height: 110,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

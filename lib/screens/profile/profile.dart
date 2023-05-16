import 'package:beholder_companion/screens/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
        title: const Text(
          'Profile',
          style: TextStyle(color: Color(0xff000000))
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5), // Border width
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(90), // Image radius
                    child: Image.asset('assets/profile/profilepic.png', fit: BoxFit.cover),
                  ),
                ),
              ]
            ),
          ),
          const Text(
            '\nTutuzinGameplays69',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),
          ),
          const Text(
            '\n20 anos, nerd e otaku fedido!',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )
            ),
            child: const Text('Seguir'),
          ),
          Row(
            children: const <Widget>[
              Text('Sistemas'),
              SizedBox(height: 100)
            ]
          ),
          Row(
              children: const <Widget>[
                Text('Mesas'),
                SizedBox(height: 100)
              ]
          ),
          Row(
              children: const <Widget>[
                Text('Personagens'),
                SizedBox(height: 100)
              ]
          ),
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  profilePageState createState() => profilePageState();
}

class profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        centerTitle: true,
        leading: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back_sharp, color: Color(0xff000000))),
        title: const Text(
          'Profile',
          style: TextStyle(color: Color(0xff000000))
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5), // Border width
            decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(90), // Image radius
                    child: Image.asset('assets/profile/profilepic.png', fit: BoxFit.cover),
                  ),
                ),
              ]
            ),
          ),
          Container(
            child: Text(
              '\nTutuzinGameplays69',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
          ),
          Container(
            child: Text(
              '\n20 anos, nerd e otaku fedido!',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 16
              ),
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
          Container(
            child: Row(
              children: <Widget>[
                Text('Sistemas'),
                SizedBox(height: 100)
              ]
            ),
          ),
          Container(
            child: Row(
                children: <Widget>[
                  Text('Mesas'),
                  SizedBox(height: 100)
                ]
            ),
          ),
          Container(
            child: Row(
                children: <Widget>[
                  Text('Personagens'),
                  SizedBox(height: 100)
                ]
            ),
          ),
        ],
      )
    );
  }
}
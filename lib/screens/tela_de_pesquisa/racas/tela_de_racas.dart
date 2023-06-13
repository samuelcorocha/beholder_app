import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeRacas extends StatefulWidget {
  const TelaDeRacas ({Key? key}) : super(key: key);

  @override
  TelaDeRacasState createState() => TelaDeRacasState();
}

class TelaDeRacasState extends State<TelaDeRacas> {

  List<dynamic> races = [];

  @override
  void initState() {
    super.initState();
    fetchRaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Raças'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: races.length,
          itemBuilder: (context, index){
            final race = races[index];
            final name = race['name'];
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(name, style: const TextStyle(color: Colors.black)),
            );
          }
      ),
    );
  }
  void fetchRaces() async {
    if (kDebugMode) {
      print('fetchRaces called');
    }
    const url = 'https://www.dnd5eapi.co/api/races';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      races = json['results'];
    });
    if (kDebugMode) {
      print('fetchRaces completed');
    }
  }
}

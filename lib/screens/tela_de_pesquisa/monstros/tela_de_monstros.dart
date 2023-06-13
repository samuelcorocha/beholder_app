import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeMonstros extends StatefulWidget {
  const TelaDeMonstros ({Key? key}) : super(key: key);

  @override
  TelaDeMonstrosState createState() => TelaDeMonstrosState();
}

class TelaDeMonstrosState extends State<TelaDeMonstros> {

  List<dynamic> monsters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMonsters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Monsters'),
        centerTitle: true,
      ),
      body: isLoading
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: monsters.length,
        itemBuilder: (context, index){
          final monster = monsters[index];
          final name = monster['name'];
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(name, style: const TextStyle(color: Colors.black)),
          );
        }
      ),
    );
  }
  void fetchMonsters() async {
    if (kDebugMode) {
      print('fetchMonsters called');
    }
    const url = 'https://www.dnd5eapi.co/api/monsters';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      monsters = json['results'];
      isLoading = false;
    });
    if (kDebugMode) {
      print('fetchMonsters completed');
    }
  }
}
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeMagias extends StatefulWidget {
  const TelaDeMagias ({Key? key}) : super(key: key);

  @override
  TelaDeMagiasState createState() => TelaDeMagiasState();
}

class TelaDeMagiasState extends State<TelaDeMagias> {

  List<dynamic> spells = [];

  @override
  void initState() {
    super.initState();
    fetchSpells();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Spells'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: spells.length,
          itemBuilder: (context, index){
            final spell = spells[index];
            final name = spell['name'];
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(name, style: const TextStyle(color: Colors.black)),
            );
          }
      ),
    );
  }
  void fetchSpells() async {
    if (kDebugMode) {
      print('fetchSpells called');
    }
    const url = 'https://www.dnd5eapi.co/api/spells';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      spells = json['results'];
    });
    if (kDebugMode) {
      print('fetchSpells completed');
    }
  }
}
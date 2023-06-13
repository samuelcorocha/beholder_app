import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeItens extends StatefulWidget {
  const TelaDeItens ({Key? key}) : super(key: key);

  @override
  TelaDeItensState createState() => TelaDeItensState();
}

class TelaDeItensState extends State<TelaDeItens> {

  List<dynamic> equipments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEquipments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Itens'),
        centerTitle: true,
      ),
      body: isLoading
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: equipments.length,
        itemBuilder: (context, index){
          final equipment = equipments[index];
          final name = equipment['name'];
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(name, style: const TextStyle(color: Colors.black)),
          );
        }
      ),
    );
  }
  void fetchEquipments() async {
    if (kDebugMode) {
      print('fetchEquipments called');
    }
    const url = 'https://www.dnd5eapi.co/api/equipment';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      equipments = json['results'];
      isLoading = false;
    });
    if (kDebugMode) {
      print('fetchEquipments completed');
    }
  }
}

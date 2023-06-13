import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeClasses extends StatefulWidget {
  const TelaDeClasses ({Key? key}) : super(key: key);

  @override
  TelaDeClassesState createState() => TelaDeClassesState();
}

class TelaDeClassesState extends State<TelaDeClasses> {

  List<dynamic> classes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Classes'),
        centerTitle: true,
      ),
      body: isLoading
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index){
          final classe = classes[index];
          final name = classe['name'];
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(name, style: const TextStyle(color: Colors.black)),
          );
        }
      ),
    );
  }
  void fetchClasses() async {
    if (kDebugMode) {
      print('fetchClasses called');
    }
    const url = 'https://www.dnd5eapi.co/api/classes';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      classes = json['results'];
      isLoading = false;
    });
    if (kDebugMode) {
      print('fetchClasses completed');
    }
  }
}

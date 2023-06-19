import 'dart:convert';
import 'package:beholder_companion/screens/tela_de_pesquisa/classes/descricao_de_classe.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeClasses extends StatefulWidget {
  const TelaDeClasses({Key? key}) : super(key: key);

  @override
  TelaDeClassesState createState() => TelaDeClassesState();
}

class TelaDeClassesState extends State<TelaDeClasses> {
  bool carregado = true;
  List<dynamic> classes = [];
  List<dynamic> classesFiltradas = [];
  List<String> caminhosImagens = [
    'barbarian',
    'bard',
    'cleric',
    'druid',
    'fighter',
    'monk',
    'paladin',
    'ranger',
    'rogue',
    'sorcerer',
    'warlock',
    'wizard'
  ];

  TextEditingController pesquisaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requisitarClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Classes', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: carregado
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: pesquisaController,
              textAlignVertical: TextAlignVertical.bottom,
              onChanged: (value) {
                filtrarClasses(value);
              },
              decoration: const InputDecoration(
                hintText: 'Pesquisar...',
                prefixIcon: Icon(Icons.search, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16),
              itemCount: classesFiltradas.length,
              itemBuilder: (context, index) {
                final classe = classesFiltradas[index];
                final name = classe['name'];
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey.shade400)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.only(left: 0),
                      backgroundColor: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 8, right: 16, bottom: 0, top: 0),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/tela_de_pesquisa/classes/${caminhosImagens[index]}.png'),
                      ),
                      title: Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Classe', style: TextStyle(color: Colors.black)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescricaoDeClasse(
                            index: classe['index'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void requisitarClasses() async {
    if (kDebugMode) {
      print('A requisição de classes foi iniciada...');
    }

    const url = 'https://www.dnd5eapi.co/api/classes';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      classes = json['results'];
      classesFiltradas = classes;
      carregado = false;
    });

    if (kDebugMode) {
      print('A requisição de classes foi concluída.');
    }
  }

  void filtrarClasses(String filtro) {
    setState(() {
      if (filtro.isEmpty) {
        classesFiltradas = classes;
      } else {
        classesFiltradas = classes.where((classe) {
          final name = classe['name'].toString().toLowerCase();
          return name.contains(filtro.toLowerCase());
        }).toList();
      }
    });
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'descricao_de_item.dart';

class TelaDeItens extends StatefulWidget {
  const TelaDeItens({Key? key}) : super(key: key);

  @override
  TelaDeItensState createState() => TelaDeItensState();
}

class TelaDeItensState extends State<TelaDeItens> {
  bool carregado = true;
  List<dynamic> classes = [];
  List<dynamic> classesFiltradas = [];

  TextEditingController pesquisaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requisitarItens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Itens', style: TextStyle(color: Colors.black)),
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
                filtrarItens(value);
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
                      title: Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Item', style: TextStyle(color: Colors.black)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescricaoDeItem(
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

  void requisitarItens() async {
    if (kDebugMode) {
      print('A requisição de itens foi iniciada...');
    }

    const url = 'https://www.dnd5eapi.co/api/equipment';
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
      print('A requisição de itens foi concluída.');
    }
  }

  void filtrarItens(String filtro) {
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

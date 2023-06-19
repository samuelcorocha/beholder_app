import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'descricao_de_raca.dart';

class TelaDeRacas extends StatefulWidget {
  const TelaDeRacas({Key? key}) : super(key: key);

  @override
  TelaDeRacasState createState() => TelaDeRacasState();
}

class TelaDeRacasState extends State<TelaDeRacas> {
  bool carregado = true;
  List<dynamic> racas = [];
  List<dynamic> racasFiltradas = [];

  TextEditingController pesquisaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requisitarRacas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Raças', style: TextStyle(color: Colors.black)),
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
                filtrarRacas(value);
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
              itemCount: racasFiltradas.length,
              itemBuilder: (context, index) {
                final raca = racasFiltradas[index];
                final name = raca['name'];
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
                      subtitle: const Text('Raça', style: TextStyle(color: Colors.black)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescricaoDeRaca(
                            index: raca['index'],
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

  void requisitarRacas() async {
    if (kDebugMode) {
      print('A requisição de raças foi iniciada...');
    }

    const url = 'https://www.dnd5eapi.co/api/races';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      racas = json['results'];
      racasFiltradas = racas;
      carregado = false;
    });

    if (kDebugMode) {
      print('A requisição de raças foi concluída.');
    }
  }

  void filtrarRacas(String filtro) {
    setState(() {
      if (filtro.isEmpty) {
        racasFiltradas = racas;
      } else {
        racasFiltradas = racas.where((raca) {
          final name = raca['name'].toString().toLowerCase();
          return name.contains(filtro.toLowerCase());
        }).toList();
      }
    });
  }
}

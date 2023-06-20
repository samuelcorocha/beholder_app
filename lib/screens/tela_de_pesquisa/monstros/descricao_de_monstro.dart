import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DescricaoDeMonstro extends StatefulWidget {

  const DescricaoDeMonstro ({
    super.key,
    required this.index,
  });

  final String index;

  @override
  DescricaoDeMonstroState createState() => DescricaoDeMonstroState();
}

class DescricaoDeMonstroState extends State<DescricaoDeMonstro> {

  late Map<String, dynamic> dados;
  bool carregado = true;

  @override
  void initState() {
    super.initState();
    requisitarMonstro(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: carregado
        ? AppBar()
        : AppBar(
          title: Text(dados['name'].toString()),
          centerTitle: true,
        ),
        body: carregado
            ? const Center(child: CircularProgressIndicator())
            : ListView(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Size:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                subtitle: Text(
                    dados['size'].toString(),
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18
                    )
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Type:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                subtitle: Text(
                    dados['type'].toString(),
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18
                    )
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Alignment:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                subtitle: Text(
                    dados['alignment'].toString(),
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18
                    )
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Armor Class:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                subtitle: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dados['armor_class'].length,
                  itemBuilder: (context, int index) {
                    return Text(
                      '${dados['armor_class'][index]['type'].toString()}  -  '
                      '${dados['armor_class'][index]['value'].toString()}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    );
                  },
                ),
              ),
            ]
        )
    );
  }

  void requisitarMonstro(String index) async {

    if (kDebugMode) {
      print('A requisição desse monstro foi iniciada...');
    }

    final response = await http.get(Uri.https('dnd5eapi.co', 'api/monsters/$index'));
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      dados = json;
      carregado = false;
    });

    if (kDebugMode) {
      print('A requisição desse monstro foi concluída.');
    }

    if (kDebugMode) {
      print('');
    }
  }
}
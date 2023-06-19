import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DescricaoDeItem extends StatefulWidget {

  const DescricaoDeItem ({
    super.key,
    required this.index,
  });

  final String index;

  @override
  DescricaoDeItemState createState() => DescricaoDeItemState();
}

class DescricaoDeItemState extends State<DescricaoDeItem> {

  late Map<String, dynamic> dados;
  bool carregado = true;
  bool possuiDescricao = false;

  @override
  void initState() {
    super.initState();
    requisitarItem(widget.index);
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
          possuiDescricao
          ? ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Descrição:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['desc'][0].toString(),
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18
              )
            ),
          )
          : Container(),
          ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Categoria de equipamento:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['equipment_category']['name'].toString(),
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
                'Custo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              '${dados['cost']['quantity'].toString()} ${dados['cost']['unit'].toString()}',
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
                'Peso:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              '${dados['weight'].toString()} kg',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18
              )
            ),
          )
        ]
      )
    );
  }

  void requisitarItem(String index) async {

    String aux;

    if (kDebugMode) {
      print('A requisição desse item foi iniciada...');
    }

    final response = await http.get(Uri.https('dnd5eapi.co', 'api/equipment/$index'));
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      dados = json;
      carregado = false;
      try {
        possuiDescricao = true;
          aux = dados['desc'][0].toString();
      } catch (e) {
        possuiDescricao = false;
      }
    });

    if (kDebugMode) {
      print('A requisição desse item foi concluída.');
    }

    if (kDebugMode) {
      print(possuiDescricao);
    }
  }
}
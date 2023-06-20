import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DescricaoDeMagia extends StatefulWidget {

  const DescricaoDeMagia ({
    super.key,
    required this.index,
  });

  final String index;

  @override
  DescricaoDeMagiaState createState() => DescricaoDeMagiaState();
}

class DescricaoDeMagiaState extends State<DescricaoDeMagia> {

  late Map<String, dynamic> dados;
  bool carregado = true;
  bool possuiDano = false;

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
          ListTile(
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
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Alcance:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['range'].toString(),
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
                'Ritual:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['ritual'].toString(),
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
                'Concentração:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['concentration'].toString(),
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
                'Duração:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['duration'].toString(),
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
                'Tempo de casting:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Text(
              dados['casting_time'].toString(),
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18
              )
            ),
          ),
          possuiDano
          ? ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Tipo de dano:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, int index) {
                return Text(
                  dados['damage']['damage_type']['name'].toString(),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                );
              },
            ),
          )
          : Container()
        ]
      )
    );
  }

  void requisitarItem(String index) async {

    if (kDebugMode) {
      print('A requisição dessa magia foi iniciada...');
    }

    final response = await http.get(Uri.https('dnd5eapi.co', 'api/spells/$index'));
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      dados = json;
      carregado = false;

      try {
        possuiDano = true;
        dados['damage']['damage_type']['name'].toString();
      } catch (e) {
        possuiDano = false;
      }
    });

    if (kDebugMode) {
      print('A requisição dessa magia foi concluída.');
    }
  }
}
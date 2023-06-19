import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DescricaoDeRaca extends StatefulWidget {

  const DescricaoDeRaca ({
    super.key,
    required this.index,
  });

  final String index;

  @override
  DescricaoDeRacaState createState() => DescricaoDeRacaState();
}

class DescricaoDeRacaState extends State<DescricaoDeRaca> {

  late Map<String, dynamic> dados;
  bool carregado = true;

  @override
  void initState() {
    super.initState();
    requisitarRaca(widget.index);
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
          topico('Alinhamento:', 'alignment'),
          topico('Idade:', 'age'),
          topicoTamanho(),
          topico('Línguas:', 'language_desc'),
          topicoTracos(),
        ]
      )
    );
  }

  Widget topico(String titulo, String subtitulo) {
    return ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
      subtitle: Column(
        children: [
          Text(
            dados[subtitulo].toString(),
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18
            )
          ),
        ],
      ),
    );
  }

  Widget topicoTamanho() {
    return ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          'Tamanho:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${dados['size'].toString()};\n'
            '${dados['size_description'].toString()}',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget topicoTracos() {
    return ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          'Traços:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
      subtitle: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: dados['traits'].length,
        itemBuilder: (context, int index) {
          return Text(
            dados['traits'][index]['name'].toString(),
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          );
        },
      ),
    );
  }

  void requisitarRaca(String index) async {

    if (kDebugMode) {
      print('A requisição dessa raça foi iniciada...');
    }

    final response = await http.get(Uri.https('dnd5eapi.co', 'api/races/$index'));
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      dados = json;
      carregado = false;
    });

    if (kDebugMode) {
      print('A requisição dessa raça foi concluída.');
    }
  }
}
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DescricaoDeClasse extends StatefulWidget {

  const DescricaoDeClasse ({
    super.key,
    required this.index,
  });

  final String index;

  @override
  DescricaoDeClasseState createState() => DescricaoDeClasseState();
}

class DescricaoDeClasseState extends State<DescricaoDeClasse> {

  late Map<String, dynamic> dados;
  bool carregado = true;
  bool possuiMagias = false;

  @override
  void initState() {
    super.initState();
    requisitarClasse(widget.index);
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
                'Starting hit die points:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: Text(
              dados['hit_die'].toString(),
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
                'Proficiency choices:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: Column(
              children: [
                Text(
                  '${dados['proficiency_choices'][0]['desc'].toString()}:\n',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18
                  )
                ),
                ListView.builder(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dados['proficiencies'].length - dados['saving_throws'].length,
                  itemBuilder: (context, int index) {
                    return Text(
                      dados['proficiencies'][index]['name'].toString(),
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Saving throws:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: ListView.builder(
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: dados['saving_throws'].length,
              itemBuilder: (context, int index) {
                return Text(
                  dados['saving_throws'][index]['name'].toString(),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                );
              },
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Starting equipment:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: ListView.builder(
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: dados['starting_equipment'].length,
              itemBuilder: (context, int index) {
                return Text(
                  '${dados['starting_equipment'][index]['equipment']['name'].toString()}  -  '
                  'quantity: ${dados['starting_equipment'][index]['quantity'].toString()}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                );
              },
            ),
          ),
          possuiMagias
          ? ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Spellcasting:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            subtitle: ListView.builder(
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: dados['spellcasting']['info'].length,
              itemBuilder: (context, int index) {
                return RichText(
                  text: TextSpan(
                    children: <InlineSpan> [
                      TextSpan(
                        text: '\n${dados['spellcasting']['info'][index]['name'].toString()}: ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Chivo',
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: dados['spellcasting']['info'][index]['desc'].toString().replaceAll('[', '').replaceAll(']', ''),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Chivo',
                          fontSize: 18,
                        ),
                      ),
                    ]
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

  void requisitarClasse(String index) async {

    if (kDebugMode) {
      print('A requisição dessa classe foi iniciada...');
    }

    final response = await http.get(Uri.https('dnd5eapi.co', 'api/classes/$index'));
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      dados = json;
      carregado = false;

      try {
        possuiMagias = true;
        dados['spellcasting']['info'][0]['name'].toString();
      } catch (e) {
        possuiMagias = false;
      }
    });

    if (kDebugMode) {
      print('A requisição dessa classe foi concluída.');
    }
  }
}
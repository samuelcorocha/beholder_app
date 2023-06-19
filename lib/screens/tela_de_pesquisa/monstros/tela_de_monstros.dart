import 'dart:convert';
import 'package:beholder_companion/screens/tela_de_pesquisa/monstros/descricao_de_monstro.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TelaDeMonstros extends StatefulWidget {
  const TelaDeMonstros({Key? key}) : super(key: key);

  @override
  TelaDeMonstrosState createState() => TelaDeMonstrosState();
}

class TelaDeMonstrosState extends State<TelaDeMonstros> {
  bool carregado = true;
  List<dynamic> monstros = [];
  List<dynamic> imagens = [];

  TextEditingController pesquisaController = TextEditingController();
  List<dynamic> monstrosFiltrados = [];

  @override
  void initState() {
    super.initState();
    requisitarMonstros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Monstros', style: TextStyle(color: Colors.black)),
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
                filtrarMonstros(value);
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
              itemCount: monstrosFiltrados.length,
              itemBuilder: (context, index) {
                final monstro = monstrosFiltrados[index];
                final name = monstro['name'];
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
                        backgroundColor: const Color(0xFFe05260),
                        child: ClipOval(
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/images/placeholder.png'),
                            image: NetworkImage('https://www.dnd5eapi.co/api/images/monsters/${monstro['index']}.png'),
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                            imageErrorBuilder: (context, error, stackTrace) {
                              final initial = name.isNotEmpty ? name[0] : '';
                              return Text(initial);
                            },
                          ),
                        ),

                      ),
                      title: Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Monstro', style: TextStyle(color: Colors.black)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescricaoDeMonstro(
                            index: monstro['index'],
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

  void requisitarMonstros() async {
    if (kDebugMode) {
      print('A requisição de monstros foi iniciada...');
    }

    const url = 'https://www.dnd5eapi.co/api/monsters';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      monstros = json['results'];
      monstrosFiltrados = monstros;
      carregado = false;
    });

    if (kDebugMode) {
      print('A requisição de monstros foi concluída.');
    }
  }

  void filtrarMonstros(String filtro) {
    setState(() {
      if (filtro.isEmpty) {
        monstrosFiltrados = monstros;
      } else {
        monstrosFiltrados = monstros.where((monstro) {
          final name = monstro['name'].toString().toLowerCase();
          return name.contains(filtro.toLowerCase());
        }).toList();
      }
    });
  }
}

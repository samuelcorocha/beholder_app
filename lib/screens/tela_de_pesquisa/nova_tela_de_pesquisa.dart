import 'package:flutter/material.dart';

import 'classes/tela_de_classes.dart';
import 'itens/tela_de_itens.dart';
import 'racas/tela_de_racas.dart';
import 'monstros/tela_de_monstros.dart';
import 'magias/tela_de_magias.dart';
import 'artefatos/tela_de_artefatos.dart';
import 'outros/tela_de_outros.dart';
import 'historico/tela_de_historico.dart';
import 'favoritos/tela_de_favoritos.dart';

class NovaTelaDePesquisa extends StatefulWidget {
  const NovaTelaDePesquisa ({Key? key}) : super(key: key);

  @override
  NovaTelaDePesquisaState createState() => NovaTelaDePesquisaState();
}

class NovaTelaDePesquisaState extends State<NovaTelaDePesquisa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const BarraSuperior(),
          method(),
        ],
      ),
    );
  }
  
  Widget method() => SliverToBoxAdapter(
    child: Column(
      children: [
        const SizedBox(height: 16.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/necromancer.png', texto: 'Classes', caminhoResultado: 'classes'),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/cajado.png', texto: 'Itens', caminhoResultado: 'itens'),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/elfa.png', texto: 'Raças', caminhoResultado: 'racas'),
          ],
        ),
        const SizedBox(height: 28.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/grifo.png', texto: 'Monstros', caminhoResultado: 'monstros'),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/chama_rosa.png', texto: 'Magias', caminhoResultado: 'magias'),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/anel_magico.png', texto: 'Artefatos', caminhoResultado: 'artefatos'),
          ],
        ),
        const SizedBox(height: 28.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/dado.png', texto: 'Outros', caminhoResultado: 'outros'),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/ampulheta.png', texto: 'Histórico', caminhoResultado: 'historico'),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/estrela.png', texto: 'Favoritos', caminhoResultado: 'favoritos'),
          ],
        ),
        const SizedBox(height:80.0),
        Column(
          children: [
            const Text('Escolha o sistema:', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            SizedBox(
              child: MaterialButton(
                textColor: Colors.white,
                splashColor: Colors.greenAccent,
                elevation: 0,
                child: Container(
                  width: 360,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tela_de_pesquisa/sistemas/fundo_dnd.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 36, right: 8, bottom: 8),
                    child: Text("Dungeons & Dragons\n       Quinta Edição", textAlign: TextAlign.left),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height:72.0),
      ],
    ),
  );
}

class BotaoDeClasse extends StatefulWidget {
  const BotaoDeClasse ({
    super.key,
    required this.caminhoImagem,
    required this.texto,
    required this.caminhoResultado
  });

  final String caminhoImagem;
  final String texto;
  final String caminhoResultado;

  @override
  BotaoDeClasseState createState() => BotaoDeClasseState();
}

class BotaoDeClasseState extends State<BotaoDeClasse> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
        onPressed: () {
          if(widget.caminhoResultado == 'classes')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeClasses()),
            );
          } else if(widget.caminhoResultado == 'itens')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeItens()),
            );
          } else if(widget.caminhoResultado == 'racas')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeRacas()),
            );
          } else if(widget.caminhoResultado == 'monstros')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeMonstros()),
            );
          } else if(widget.caminhoResultado == 'magias')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeMagias()),
            );
          } else if(widget.caminhoResultado == 'artefatos')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeArtefatos()),
            );
          } else if(widget.caminhoResultado == 'outros')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeOutros()),
            );
          } else if(widget.caminhoResultado == 'historico')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeHistorico()),
            );
          } else if(widget.caminhoResultado == 'favoritos')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeFavoritos()),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.caminhoImagem, height: 60.0),
            Text(widget.texto, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  DemoState createState() => DemoState();
}

class DemoState extends State<Demo> {
  Map<String, bool> values = {
    'Classes': false,
    'Itens': false,
    'Raças': false,
    'Monstros': false,
    'Magias': false,
    'Artefatos': false,
    'Outros': false,
    'Livros':  false,
    'Favoritos': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
        centerTitle: true,
      ),
      body: ListView(
        children: values.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: values[key],
            onChanged: (bool? value) {
              setState(() {
                values[key] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class BarraSuperior extends StatelessWidget {
  const BarraSuperior({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      pinned: true,
      title: const Text('Pesquisa', style: TextStyle(color: Colors.black)),
      leading: const Icon(Icons.person, color: Colors.black),
      actions: const [
        Icon(Icons.list, color: Colors.black),
        SizedBox(width: 18)
      ],
      bottom: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 50,
          color: Colors.white,
          child: Row(
            children: <Widget> [
              const Flexible(
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.5)
                    )
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.filter_alt),
                color: Colors.black,
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: false,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (_) => const Demo()
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
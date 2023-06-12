import 'package:flutter/material.dart';

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
          barraSuperior(),
          method(),
        ],
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }

  SliverAppBar barraSuperior() {
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
  
  Widget method() => SliverToBoxAdapter(
    child: Column(
      children: [
        const SizedBox(height: 16.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/necromancer.png', texto: 'Classes'),
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/cajado.png', texto: 'Itens'),
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/elfa.png', texto: 'Raças'),
          ],
        ),
        const SizedBox(height: 16.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/grifo.png', texto: 'Monstros'),
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/chama_rosa.png', texto: 'Magias'),
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/anel_magico.png', texto: 'Artefatos'),
          ],
        ),
        const SizedBox(height: 16.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/dado.png', texto: 'Outros'),
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/ampulheta.png', texto: 'Histórico'),
            BotaoDeClasse(caminho: 'assets/tela_de_pesquisa/botoes/estrela.png', texto: 'Favoritos'),
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

class BarraInferior extends StatelessWidget {
  const BarraInferior({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[400],
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Encontrar',
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Personagens',
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow),
          label: 'Mesas',
          backgroundColor: Colors.white
        ),
      ]
    );
  }
}

class BotaoDeClasse extends StatefulWidget {
  const BotaoDeClasse ({
    super.key,
    required this.caminho,
    required this.texto
  });

  final String caminho;
  final String texto;

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
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.caminho, height: 60.0),
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
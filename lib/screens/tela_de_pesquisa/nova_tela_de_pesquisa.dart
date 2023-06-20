import 'package:beholder_companion/screens/profile/profile.dart';
import 'package:flutter/material.dart';

import '../tela_de_login/nova_tela_de_login.dart';
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

  final MaterialColor colorPalette = const MaterialColor(
    0xFF0000FF,
    <int, Color>{
      50: Color(0xFFD72638),
      100: Color(0xFFE05260),
      200: Color(0xFF9C1C28),
      300: Color(0xFF463239),
      400: Color(0xFFEFE7E9),
      500: Color(0xFF000000),
      600: Color(0xFFDFDFDF),
      700: Color(0xFFEAEAEA),
      800: Color(0xFFFAFAFA),
      900: Color(0xFFFFFFFF),
      1000: Color(0x8C000000),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Pesquisa', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
      children: [
        const SizedBox(height: 16.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/necromante.png', texto: 'Classes', caminhoResultado: 'classes', emBreve: false),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/cajado.png', texto: 'Itens', caminhoResultado: 'itens', emBreve: false),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/elfa.png', texto: 'Raças', caminhoResultado: 'racas', emBreve: false),
          ],
        ),
        const SizedBox(height: 28.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/grifo.png', texto: 'Monstros', caminhoResultado: 'monstros', emBreve: false),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/chama_rosa.png', texto: 'Magias', caminhoResultado: 'magias', emBreve: false),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/anel_magico.png', texto: 'Artefatos', caminhoResultado: 'artefatos', emBreve: true),
          ],
        ),
        const SizedBox(height: 28.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/dado.png', texto: 'Outros', caminhoResultado: 'outros', emBreve: true),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/ampulheta.png', texto: 'Histórico', caminhoResultado: 'historico', emBreve: true),
            BotaoDeClasse(caminhoImagem: 'assets/tela_de_pesquisa/botoes/estrela.png', texto: 'Favoritos', caminhoResultado: 'favoritos', emBreve: true),
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('O que deseja fazer?', textAlign: TextAlign.center,),
              ),
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NovaTelaDeLogin(colorPalette: colorPalette)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BotaoDeClasse extends StatefulWidget {

  const BotaoDeClasse ({
    super.key,
    required this.caminhoImagem,
    required this.texto,
    required this.caminhoResultado,
    required this.emBreve
  });

  final String caminhoImagem;
  final String texto;
  final String caminhoResultado;
  final bool emBreve;

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
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[400],
          elevation: 15,
          padding: const EdgeInsets.all(0)
        ),
        onPressed: () {
          if(widget.caminhoResultado == 'classes') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeClasses()),
            );
          } else if(widget.caminhoResultado == 'itens') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeItens()),
            );
          } else if(widget.caminhoResultado == 'racas') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeRacas()),
            );
          } else if(widget.caminhoResultado == 'monstros') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeMonstros()),
            );
          } else if(widget.caminhoResultado == 'magias') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeMagias()),
            );
          } else if(widget.caminhoResultado == 'artefatos') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeArtefatos()),
            );
          } else if(widget.caminhoResultado == 'outros') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeOutros()),
            );
          } else if(widget.caminhoResultado == 'historico') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeHistorico()),
            );
          } else if(widget.caminhoResultado == 'favoritos') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDeFavoritos()),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.emBreve
            ? Container(
              width: 110,
              color: Colors.red,
              child: const Text(
                'Em Breve...',
                textAlign: TextAlign.center,
              ),
            )
            : Container(),
            widget.emBreve
            ? Opacity(
              opacity: 0.3,
              child: Image.asset(widget.caminhoImagem, height: 60.0))
            : Image.asset(widget.caminhoImagem, height: 60.0),
            Text(widget.texto, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold))
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
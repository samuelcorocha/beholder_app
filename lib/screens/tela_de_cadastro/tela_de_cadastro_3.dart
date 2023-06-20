import 'package:beholder_companion/screens/tela_de_cadastro/tela_de_cadastro_4.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TelaDeCadastro3 extends StatefulWidget {
  const TelaDeCadastro3({Key? key}) : super(key: key);

  @override
  TelaDeCadastro3State createState() => TelaDeCadastro3State();
}

class TelaDeCadastro3State extends State<TelaDeCadastro3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:
        IconButton(
          onPressed: () =>
            Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              PageTransition(
                child: const TelaDeCadastro4(),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(milliseconds: 300),
                reverseDuration: const Duration(milliseconds: 300)
              )
            ),
            icon: const Icon(Icons.arrow_forward, color: Colors.black)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32,top: 16,right: 32,bottom: 32),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: "Agora, vamos criar o seu perfil. Você é mestre, jogador, ou ambos?"),
                ]
              )
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotaoTipoUsuario(text: 'Mestre', imagePath: 'assets/tela_de_cadastro/cadastro_3/cadastro_jogador.png'),
                BotaoTipoUsuario(text: 'Jogador', imagePath: 'assets/tela_de_cadastro/cadastro_3/cadastro_mestre.png'),
              ],
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "O quão experiente você é com RPG?"),
                    ]
                  )
                ),
                const SizedBox(height: 16.0),
                const BotaoDeExperiencia(buttonTexts: [
                  'Novato, nunca joguei ou joguei pouco',
                  'Veterano: joguei várias vezes',
                  'Especialista: estou constantemente jogando'
                ]),
              ],
            )
          ]),
        ),
      )
    );
  }
}

class BotaoTipoUsuario extends StatefulWidget {
  final String text;
  final String imagePath;

  const BotaoTipoUsuario({super.key, required this.text, required this.imagePath});

  @override
  BotaoTipoUsuarioState createState() => BotaoTipoUsuarioState();
}

class BotaoTipoUsuarioState extends State<BotaoTipoUsuario> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: _isSelected ? Colors.blue : Colors.white,
        side: const BorderSide(color: Colors.black, width: 3),
        padding: const EdgeInsets.all(8.0),
      ),
      child: Column(
        children: [
          Image.asset(widget.imagePath),
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BotaoDeExperiencia extends StatefulWidget {
  final List<String> buttonTexts;

  const BotaoDeExperiencia({super.key, required this.buttonTexts});

  @override
  BotaoDeExperienciaState createState() => BotaoDeExperienciaState();
}

class BotaoDeExperienciaState extends State<BotaoDeExperiencia> {
  String? _selectedButtonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.buttonTexts.length; i++)
          Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedButtonText = widget.buttonTexts[i];
                  });
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                  _selectedButtonText == widget.buttonTexts[i]
                      ? Colors.blue
                      : Colors.white,
                  side: const BorderSide(color: Colors.black, width: 3),
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(
                  widget.buttonTexts[i],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
      ],
    );
  }
}





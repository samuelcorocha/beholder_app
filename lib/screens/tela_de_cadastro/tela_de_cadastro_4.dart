import 'dart:io';

import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TelaDeCadastro4 extends StatefulWidget {
  const TelaDeCadastro4({Key? key}) : super(key: key);

  @override
  TelaDeCadastro4State createState() => TelaDeCadastro4State();
}

class TelaDeCadastro4State extends State<TelaDeCadastro4> {

  DateTime data = DateTime.now();

  //Foto de perfil
  File? image;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 32,top: 16,right: 32,bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Qual sua data de nascimento?"),
                  ]
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                color: Colors.grey,
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now()
                  ).then((value) {
                    setState(() {
                      data = value!;
                    });
                  });
                },
                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: "${data.day}/${data.month}/${data.year}"),
                          ],
                        ),
                      ),
                      Image.asset("assets/tela_de_cadastro/cadastro_4/calendario.png"),
                    ],
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Qual seu gênero?"),
                  ]
                ),
              ),
              const BotaoDeGenero(
                buttonTexts: [
                  'Feminino',
                  'Masculino'
                ],
                imagens: [
                  'assets/tela_de_cadastro/cadastro_4/genero_feminino.png',
                  'assets/tela_de_cadastro/cadastro_4/genero_masculino.png'
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.7,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "Deseja carregar uma foto de perfil?"),
                        ]
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            title: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                    fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(text: "Escolha uma foto:"),
                                ]
                              ),
                            ),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.width / 2.7,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        pickImage(ImageSource.camera);
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.photo_camera),
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: const TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(text: "Câmera"),
                                              ]
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        pickImage(ImageSource.gallery);
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.image),
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: const TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'Chivo', fontSize: 25, color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(text: "Galeria"),
                                              ]
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    },
                    child:
                    Column(
                      children: [
                        image != null ? Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipOval(
                            child: Image.file(
                              image!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover
                            )
                          ),
                        ) : Image.asset('assets/tela_de_cadastro/cadastro_4/foto_de_usuario.png'),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const NovaTelaDeLogin(),
                    type: PageTransitionType.rightToLeft,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300)
                  )
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20.0)),
                child: const Text("Confirmar"),
              ),
            ],
          ),
        )
    );
  }
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }
}

class BotaoDeGenero extends StatefulWidget {

  final List<String> buttonTexts;
  final List<String> imagens;

  const BotaoDeGenero({super.key, required this.buttonTexts, required this.imagens});

  @override
  BotaoDeGeneroState createState() => BotaoDeGeneroState();
}

class BotaoDeGeneroState extends State<BotaoDeGenero> {
  String? _selectedButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < widget.buttonTexts.length; i++)
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child: OutlinedButton(
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
                  child: Column(
                    children: [
                      Image.asset(widget.imagens[i]),
                      Text(
                        widget.buttonTexts[i],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
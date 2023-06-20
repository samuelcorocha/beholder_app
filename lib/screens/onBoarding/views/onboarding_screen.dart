import 'package:beholder_companion/screens/tela_de_login/nova_tela_de_login.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  final MaterialColor colorPalette;

  const OnBoardingScreen({Key? key, required this.colorPalette}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(children: [
          PageView.builder(
              itemCount: dataShow.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) => OnBoardContent(
                  image: dataShow[index].image,
                  description: dataShow[index].description,
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 100.0),
              child: SizedBox(
                height: 60,
                width: 60,
                child: TextButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.resolveWith(
                          (states) => const BorderSide(
                                width: 0,
                                color: Colors.transparent,
                                style: BorderStyle.solid,
                              )),
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ))),
                  onPressed: () {
                    if (_pageIndex == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  NovaTelaDeLogin(colorPalette: widget.colorPalette)),
                      );
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }
                  },
                  child: Image.asset("assets/icons/Arrow 1.png"),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(dataShow.length, (index) => Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: DotIndicator(isActive: index == _pageIndex),
                  ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key ? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffEFE7E9) : const Color(0xffC6A9B0),
        borderRadius: const BorderRadius.all(Radius.circular(200)),
      ),
    );
  }
}

class Onboard {
  final String image, description;

  Onboard({required this.image, required this.description});
}

final List<Onboard> dataShow = [
  Onboard(
      image: "assets/onBoarding/Screen01.png",
      description:
          "O Beholder Companion é uma\n ferramenta completa para as\n suas sessões de RPG"),
  Onboard(
      image: "assets/onBoarding/Screen02.png",
      description:
          "Onde você pode encontrar\n jogadores e mestres\n próximos a você"),
  Onboard(
      image: "assets/onBoarding/Screen03.png",
      description: "Cadastre-se e descubra sua\n próxima grande aventura já!"),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.description,
  });

  final String image, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge
        ),
      ),
    );
  }
}

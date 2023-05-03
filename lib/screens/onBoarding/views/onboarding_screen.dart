import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(children: [
          PageView.builder(
              itemBuilder: (context, index) => const OnBoardContent(
                  image: "assets/onBoarding/Screen01.png",
                  description:
                      "O Beholder Companion é uma ferramenta completa para as suas sessões de RPG")
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 100.0),
              child: SizedBox(
                height: 60,
                width: 60,
                child: TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.resolveWith((states) => const BorderSide(
                      width: 0,
                      color: Colors.transparent,
                      style: BorderStyle.solid,
                    )),
                    shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))
                  ),
                  onPressed: () {},
                  child: Image.asset("assets/icons/Arrow 1.png"),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

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
          style: const TextStyle(
            fontFamily: 'Chivo',
            fontSize: 19.0,
            color: Color(0xffffffff),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

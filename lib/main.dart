import 'package:beholder_companion/screens/onBoarding/views/onboarding_screen.dart';
import 'package:beholder_companion/screens/tela_de_pesquisa/nova_tela_de_pesquisa.dart';
import 'package:beholder_companion/screens/tela_de_social/tela_de_social.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor colorPalette = const MaterialColor(
    0xFF0000FF,
    <int, Color>{
      50: Color(0xFFD72638),
      100: Color(0xFFE05260),
      200: Color(0xFF9C1C28),
      250: Color(0xFFC6A9B0),
      300: Color(0xFF463239),
      400: Color(0xFFEFE7E9),
      500: Color(0xFF000000),
      600: Color(0xFFDFDFDF),
      700: Color(0xFFEAEAEA),
      800: Color(0xFFFAFAFA),
      900: Color(0xFFFFFFFF),
      1000: Color(0x8C000000),
      1100: Color(0x54000000),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Chivo',
              color: colorPalette.shade900,
              fontWeight: FontWeight.normal,
            ),
            displayMedium: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Chivo',
              color: colorPalette.shade500,
              fontWeight: FontWeight.normal,
            ),
            headlineLarge: TextStyle(
              fontSize: 24.0,
              fontFamily: 'Chivo',
              color: colorPalette.shade50,
              fontWeight: FontWeight.normal,
            ),
            displaySmall: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Chivo',
              color: colorPalette.shade500,
              fontWeight: FontWeight.normal,
            ),
            headlineMedium: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Chivo',
              color: colorPalette.shade500,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: const TextStyle(
              fontSize: 13.0,
              fontFamily: 'Chivo',
              color: Color(0x54000000),
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic,
            ),),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: colorPalette),
      ),
      home: TelaDeSocial(),
    );
  }
}
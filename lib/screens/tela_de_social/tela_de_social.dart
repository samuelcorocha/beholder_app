import 'dart:math';

import 'package:beholder_companion/screens/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../classes/geolocator.dart';

class SectionNavigator extends StatefulWidget {
  const SectionNavigator({super.key});

  @override
  State<SectionNavigator> createState() => _SectionNavigatorState();
}

class _SectionNavigatorState extends State<SectionNavigator>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person, color: Color(0xff000000))),
        title: const Text('Social', style: TextStyle(color: Color(0xff000000))),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.red,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          tabs: const <Widget>[
            Tab(
              text: 'Explorar',
            ),
            Tab(text: 'Chat'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ChangeNotifierProvider<GeoController>(
            create: (context) => GeoController(),
            child: Builder(builder: (context) {
              final local = context.watch<GeoController>();

              String message = local.error == ''
                  ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
                  : local.error;

              if (local.error == '' &&
                  local.lat != 0.0000000 &&
                  local.long != 0.0000000) {
                return FutureBuilder<SafeArea>(
                  future: _SocialCards(local, message),
                  builder: (context, snapshot) {
                    SafeArea? card = snapshot.data;
                    print(card);
                    return ListView(
                      children: [
                        if (card != null) card,
                      ],
                    );
                  },
                );

                //return _SocialCards(local, message);
              } else {
                return Center(
                  child: Text(local.error),
                );
              }
            }),
          ),
          const Center(
            child: Text("O chat ainda não foi implementado!"),
          ),
        ],
      ),
    );
  }

  Future<SafeArea> _SocialCards(position, message) async {
    List<Widget> cards = [];

    Future<List<Widget>> getDados() async {
      final ref = FirebaseDatabase.instance.ref();
      await ref.child("users").get().then((search) async {
        for (final data in search.children) {
          final username = data.child("username").value.toString();
          print(username);

          final experience =
              int.parse(data.child("experience").value.toString());
          String experienceText;
          switch (experience) {
            case 1:
              experienceText = "Novato";
              break;
            case 2:
              experienceText = "Veterano";
              break;
            case 3:
              experienceText = "Especialista";
              break;
            default:
              experienceText = "Desconhecido";
              break;
          }
          print(experienceText);

          final gender =
              data.child("gender").value.toString() ?? "Desconhecido";
          print(gender);

          final isMaster = bool.parse(data.child("isMaster").value.toString());
          print(isMaster);

          final isPlayer = bool.parse(data.child("isPlayer").value.toString());
          print(isPlayer);

          final latitude = data.child("lastKnowLocationLat").value != null
              ? double.parse(data.child("lastKnowLocationLat").value.toString())
              : 0.0;
          print(latitude);

          final longitude = data.child("lastKnowLocationLong").value != null
              ? double.parse(
                  data.child("lastKnowLocationLong").value.toString())
              : 0.0;
          print(longitude);

          NumberFormat formatter = NumberFormat("00");
          String distance = formatter.format(num.parse(
              (Geolocator.distanceBetween(
                          position.lat,
                          position.long,
                          double.parse(
                              data.child("lastKnowLocationLat").value.toString()),
                          double.parse(
                              data.child("lastKnowLocationLong").value.toString())) /
                      1000)
                  .toStringAsPrecision(2)));
          if (distance == "1" || distance == "0") {
            distance = "menos de 1";
          }
          cards.add(
            _Card(message: message, distance: distance, username: username, experienceText: experienceText, gender: gender, isMaster: isMaster, isPlayer: isPlayer),
          );
        }
      });
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + cards.toString());
      print(cards.last.toString());
      return cards!;
    }



    final CardSwiperController controller = CardSwiperController();

    final cardsList = await getDados();

      return SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                isLoop: true,
                cardsCount: cardsList.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 10,
                backCardOffset: const Offset(20, 20),
                padding: const EdgeInsets.all(8.0),
                cardBuilder: (context, index) => cardsList[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.close),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.done),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.message,
    required this.distance,
    required this.username,
    required this.experienceText,
    required this.gender,
    required this.isMaster,
    required this.isPlayer,
  });

  final String message;
  final String distance;
  final String username;
  final String experienceText;
  final String gender;
  final bool isMaster;
  final bool isPlayer;

  @override
  Widget build(BuildContext context) {
    print("MENSAGEMMMMMMMMMMMMMMMMMMMMMMMMMMMM " + message);
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Column(
            children: <Widget>[
              Text(message),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Há ${distance} Km de você',
                    style: const TextStyle(fontSize: 20, fontFamily: 'Chivo'),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/profile/profilepic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username,
                    style: TextStyle(fontSize: 16, fontFamily: 'Chivo'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '@$username',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'Chivo', color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Menos de um ano de Beholder',
                        style: TextStyle(fontFamily: 'Chivo'),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.grade),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Nível $experienceText',
                        style: TextStyle(fontFamily: 'Chivo'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Mestre',
                        style: TextStyle(fontFamily: 'Chivo'),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.male),
                    SizedBox(
                      width: 100,
                      child: Text(
                        gender,
                        style: TextStyle(fontFamily: 'Chivo'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Player',
                        style: TextStyle(fontFamily: 'Chivo'),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.grade),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'D&D 5e',
                        style: TextStyle(fontFamily: 'Chivo'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TelaDeSocial extends StatelessWidget {
  const TelaDeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionNavigator();
  }
}

import 'dart:math';

import 'package:beholder_companion/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../classes/geolocator.dart';
import '../tela_de_pesquisa/tela_de_pesquisa.dart';

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

              if (local.error == '' && local.lat != 0.0000000 && local.long != 0.0000000) {
                return _SocialCards(local, message);
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

  _SocialCards(position, message) {
    List<Container> cards = [];

    for (var i = 0; i < 10; i++) {
      final random = Random();
      double randomNumber = (random.nextInt(600) + 0) - (random.nextInt(600) + 0);
      double randomNumber2 = (random.nextInt(600) + 0) - (random.nextInt(600) + 0);
      NumberFormat formatter = NumberFormat("00");
      String distance = formatter.format(num.parse((Geolocator.distanceBetween(
                  position.lat, position.long, randomNumber, randomNumber2) /
              1000)
          .toStringAsPrecision(2)));
      cards.add(
        Container(
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
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Chivo'),
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Arthur',
                        style: TextStyle(fontSize: 16, fontFamily: 'Chivo'),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '@Arthur',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Chivo',
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 100,
                          child: Text(
                            '5 anos de Beholder',
                            style: TextStyle(fontFamily: 'Chivo'),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.grade),
                        SizedBox(
                          width: 100,
                          child: Text(
                            '5 anos de Beholder',
                            style: TextStyle(fontFamily: 'Chivo'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
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
                            'Masculino',
                            style: TextStyle(fontFamily: 'Chivo'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 100,
                          child: Text(
                            '5 anos de Beholder',
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
        ),
      );
    }

    final CardSwiperController controller = CardSwiperController();
    final cardsList = cards;

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

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

  _SocialFind() {
    return null;
  }
}

class TelaDeSocial extends StatelessWidget {
  const TelaDeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionNavigator();
  }
}

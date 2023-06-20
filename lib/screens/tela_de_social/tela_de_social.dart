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

              if (local.error == '' &&
                  local.lat != 0.0000000 &&
                  local.long != 0.0000000) {
                return _SocialCards(local, message);
              } else {
                return Center(
                  child: Text(local.error), // aqui
                );
              }
            }),
          ),
          ConversationList(),
        ],
      ),
    );
  }

  _SocialCards(position, message) {
    List<Container> cards = [];

    for (var i = 0; i < 10; i++) {
      final random = Random();
      double randomNumber =
          (random.nextInt(600) + 0) - (random.nextInt(600) + 0);
      double randomNumber2 =
          (random.nextInt(600) + 0) - (random.nextInt(600) + 0);
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

  bool _onSwipe(int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction
          .name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(int? previousIndex,
      int currentIndex,
      CardSwiperDirection direction,) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  _SocialFind() {
    return null;
  }
}

class ConversationList extends StatefulWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  List<Widget> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              itemList.add(Conversation(clean: () {print("limpar o ${itemList.length}");}, delete: () {print("limpar o ${itemList.length}");}, index: itemList.length+1));
            });
          },
          child: Text("teste"),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return itemList[index];
            },
          ),
        ),
      ],
    );
  }
}

class Conversation extends StatefulWidget {
  final VoidCallback? clean;
  final VoidCallback? delete;
  int index;

  Conversation({Key? key, this.clean, this.delete, required this.index}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {

  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Container(
          width: 363,
          height: 68,
          decoration: BoxDecoration(
            color: const Color(0xFFC6A9B0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.person),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome do Arthur",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6),
                  Text("Envie uma mensagem...",
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  print("Widget tocado!");
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: PopupMenuButton<String>(
                    onSelected: (String value) {
                      print("Opção selecionada: $value");
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        onTap: widget.clean,
                        value: 'option1',
                        child: Text('Limpar conversa'),
                      ),
                      PopupMenuItem<String>(
                        onTap: widget.delete,
                        value: 'option2',
                        child: Text('Excluir conversa'),
                      ),
                    ],
                    child: const Icon(Icons.more_vert),
                  ),
                ),
              )
            ],
          ),
        ),
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
